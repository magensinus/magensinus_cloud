# frozen_string_literal: true

module Endorsement
  class BadgesController < ApplicationController
    # Params
    # ------
    # Thumb
    include ThumbParams
    # Cover
    include CoverParams
    # Image
    include ImageParams
    # Document
    include DocumentParams

    # Callbacks
    # ---------
    # Endorsement badge
    before_action :endorsement_badge, only: [:show, :update, :destroy]

    # Index
    # -----
    def index
      @endorsement_badges = Endorsement::Badge.all
    end

    # Show
    # ----
    def show
    end

    # Update
    # ------
    def update
      if @endorsement_badge.update(endorsement_badge_params)
        flash[:notice] = "Successfully updated..."
        redirect_to endorsement_badge_path(@endorsement_badge)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @endorsement_badge.destroy
      redirect_to endorsement_badges_path
    end

    # New
    # ---
    def new
      @endorsement_badge = Endorsement::Badge.new
    end

    # Create
    # ------
    def create
      order = Endorsement::Badge.pluck(:position).compact
      @endorsement_badge = Endorsement::Badge.new(endorsement_badge_params)
      order << 0
      @endorsement_badge.position = (order.min - 1)
      if @endorsement_badge.save
        flash[:notice] = "Successfully created..."
        redirect_to endorsement_badge_path(@endorsement_badge)
      else
        render :new
      end
    end

    # Sortable
    # --------
    def sortable
      Endorsement::Badge.sort_position(params[:endorsement_badge])
      head :ok
    end

    private

    # Endorsement badge
    def endorsement_badge
      @endorsement_badge = Endorsement::Badge.find_by(slug: params[:id])
    end

    # Whitelist params
    def endorsement_badge_params
      params.require(:endorsement_badge).permit(
        thumb_params,
        cover_params,
        image_params,
        document_params,
        # Misc
        :title,
        :description,
        :url,
        :published,
        :position,
        # Schools
        :eml,
        :magestil,
        :magensinus
      )
    end
  end
end
