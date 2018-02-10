# frozen_string_literal: true

module Magensinus
  class NetworksController < ApplicationController
    before_action :magensinus_network, only: [:show, :edit, :update, :destroy]

    # GET /magensinus/networks
    def index
      @magensinus_networks = Magensinus::Network.all
    end

    # GET /magensinus/networks/1
    def show
    end

    # GET /magensinus/networks/new
    def new
      @magensinus_network = Magensinus::Network.new
    end

    # GET /magensinus/networks/1/edit
    def edit
    end

    # POST /magensinus/networks
    def create
      @magensinus_network = Magensinus::Network.new(magensinus_network_params)

      if @magensinus_network.save
        flash[:notice] = "Successfully created..."
        redirect_to magensinus_networks_path
      else
        render :new
      end
    end

    # PATCH/PUT /magensinus/networks/1
    def update
      if @magensinus_network.update(magensinus_network_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_networks_path
      else
        render :edit
      end
    end

    # DELETE /magensinus/networks/1
    def destroy
      @magensinus_network.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to magensinus_networks_path
    end

    private

    # Magensinus network
    def magensinus_network
      @magensinus_network = Magensinus::Network.find_by(slug: params[:id])
    end

    # Whitelist parameters
    def magensinus_network_params
      params.require(:magensinus_network).permit(
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
