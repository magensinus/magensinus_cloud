# frozen_string_literal: true

module Magestil
  class NetworksController < ApplicationController
    # Callbacks
    # ---------
    # Magestil network
    before_action :magestil_network, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    # GET /magestil/networks
    def index
      @magestil_networks = Magestil::Network.all
    end

    # Show
    # ----
    # GET /magestil/networks/jKl67Yt5
    def show
    end

    # New
    # ---
    # GET /magestil/networks/new
    def new
      @magestil_network = Magestil::Network.new
    end

    # Edit
    # ----
    # GET /magestil/networks/jKl67Yt5/edit
    def edit
    end

    # Create
    # ------
    # POST /magestil/networks
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
    # PATCH/PUT /magestil/networks/jKl67Yt5
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
    # DELETE /magestil/networks/jKl67Yt5
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

    # Whitelist parameters
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
