# frozen_string_literal: true

module Endorsement
  class BadgesController < ApplicationController
    # Params
    # ------
    # Thumb
    include ThumbParams

    # Callbacks
    # ---------
    # Endorsement badge
    before_action :endorsement_badge, only: [:edit, :update, :destroy]

    # Index
    # -----
    def index
      @endorsement_badges = Endorsement::Badge.all
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
    def update
      if @endorsement_badge.update(endorsement_badge_params)
        flash[:notice] = "Successfully updated..."
        redirect_to endorsement_badges_path
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
        redirect_to endorsement_badges_path
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
        :title,
        :description,
        :url,
        :published,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
