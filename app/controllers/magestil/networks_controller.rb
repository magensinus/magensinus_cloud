# frozen_string_literal: true

module Magestil
  class NetworksController < ApplicationController
    # Callbacks
    # ---------
    # Magestil network
    before_action :magestil_network, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @magestil_networks = Magestil::Network.all
    end

    # Show
    # ----
    def show
    end

    # New
    # ---
    def new
      @magestil_network = Magestil::Network.new
    end

    # Edit
    # ----
    def edit
    end

    # Create
    # ------
    def create
      @magestil_network = Magestil::Network.new(magestil_network_params)
      if @magestil_network.save
        flash[:notice] = "Successfully created..."
        redirect_to magestil_networks_path
      else
        render :new
      end
    end

    # Update
    # ------
    def update
      if @magestil_network.update(magestil_network_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_networks_path
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @magestil_network.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magestil_networks_path
    end

    private

    # Magestil network
    def magestil_network
      @magestil_network = Magestil::Network.find_by(slug: params[:id])
    end

    # Whitelist params
    def magestil_network_params
      params.require(:magestil_network).permit(
        :title,
        :username,
        :url,
        :thumb,
        :thumb_box,
        :thumb_caption,
        :remove_thumb_box,
        :thumb_box_cache,
        :position
      )
    end
  end
end
