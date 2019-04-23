# frozen_string_literal: true

module Partnerships
  class IdentitiesController < ApplicationController
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
    # Partnerships identity
    before_action :partnerships_identity, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @partnerships_identities = Partnerships::Identity.all
    end

    # Show
    # ----
    def show
    end

    # Edit
    # ----
    def edit
      redirect_to partnerships_identity_path(@partnerships_identity)
    end

    # Update
    # ------
    def update
      if @partnerships_identity.update(partnerships_identity_params)
        flash[:notice] = "Successfully updated..."
        redirect_to partnerships_identities_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @partnerships_identity.destroy
      redirect_to partnerships_identities_path
    end

    # New
    # ---
    def new
      @partnerships_identity = Partnerships::Identity.new
    end

    # Create
    # ------
    def create
      order = Partnerships::Identity.pluck(:position).compact
      @partnerships_identity = Partnerships::Identity.new(partnerships_identity_params)
      order << 0
      @partnerships_identity.position = (order.min - 1)
      if @partnerships_identity.save
        flash[:notice] = "Successfully created..."
        redirect_to partnerships_identities_path
      else
        render :new
      end
    end

    # Sortable
    # --------
    def sortable
      Partnerships::Identity.sort_position(params[:partnerships_identity])
      head :ok
    end

    private

    # Partnerships identity
    def partnerships_identity
      @partnerships_identity = Partnerships::Identity.find_by(slug: params[:id])
    end

    # Whitelist params
    def partnerships_identity_params
      params.require(:partnerships_identity).permit(
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
