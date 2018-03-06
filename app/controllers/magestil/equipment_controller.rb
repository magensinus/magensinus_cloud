# frozen_string_literal: true

module Magestil
  class EquipmentController < ApplicationController
    # Callbacks
    # ---------
    # Magestil equipment
    before_action :magestil_equipment, only: [:show, :edit, :update]

    # Show
    # ----
    def show
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
    def update
      if @magestil_equipment.update(magestil_equipment_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_equipment_path
      else
        render :edit
      end
    end

    private

    # Magestil equipment
    def magestil_equipment
      @magestil_equipment = Magestil::Equipment.first!
    end

    # Whitelist params
    def magestil_equipment_params
      params.require(:magestil_equipment).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache
      )
    end
  end
end
