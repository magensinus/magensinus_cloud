# frozen_string_literal: true

module Endorsement
  class BadgesController < ApplicationController
    # Callbacks
    # ---------
    # Endorsement badge
    before_action :endorsement_badge, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /endorsement/badges
    def index
      @endorsement_badges = Endorsement::Badge.all
    end

    # Edit
    # ----
    # GET /endorsement/badges/1/edit
    def edit
    end

    # Update
    # ------
    # PATCH/PUT /endorsement/badges/1
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
    # DELETE /endorsement/badges/1
    def destroy
      @endorsement_badge.destroy
      redirect_to endorsement_badges_path
    end

    # New
    # ---
    # GET /endorsement/badges/new
    def new
      @endorsement_badge = Endorsement::Badge.new
    end

    # Create
    # ------
    # POST /endorsement/badges
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
    # PATCH /endorsement/badges
    def sortable
      Endorsement::Badge.sort_position(params[:endorsement_badge])
      head :ok
    end

    private

    # Endorsement badge
    def endorsement_badge
      @endorsement_badge = Endorsement::Badge.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def endorsement_badge_params
      params.require(:endorsement_badge).permit(
        :title,
        :description,
        :url,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :thumb_box_cache,
        :published,
        :eml,
        :magestil,
        :magensinus,
        :position
      )
    end
  end
end
