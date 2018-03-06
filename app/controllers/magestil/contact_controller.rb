# frozen_string_literal: true

module Magestil
  class ContactController < ApplicationController
    # Callbacks
    # ---------
    # Magestil contact
    before_action :magestil_contact, only: [:show, :edit, :update]

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
      if @magestil_contact.update(magestil_contact_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_contact_path
      else
        render :edit
      end
    end

    private

    # Magestil contact
    def magestil_contact
      @magestil_contact = Magestil::Contact.first!
    end

    # Whitelist params
    def magestil_contact_params
      params.require(:magestil_contact).permit(
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
