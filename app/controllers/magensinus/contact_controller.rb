# frozen_string_literal: true

module Magensinus
  class ContactController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus contact
    before_action :magensinus_contact, only: [:show, :edit, :update]

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
      if @magensinus_contact.update(magensinus_contact_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_contact_path
      else
        render :edit
      end
    end

    private

    # Magensinus contact
    def magensinus_contact
      @magensinus_contact = Magensinus::Contact.first!
    end

    # Whitelist params
    def magensinus_contact_params
      params.require(:magensinus_contact).permit(
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body,
        :fax,
        :email,
        :phone,
        :address_one,
        :address_two,
        :postcode,
        :city,
        :country,
        :image,
        :image_box,
        :image_caption,
        :remove_image_box,
        :image_box_cache
      )
    end
  end
end
