# frozen_string_literal: true

module Magensinus
  class ContactController < ApplicationController
    before_action :set_magensinus_contact, only: [:show, :edit, :update, :destroy]

    # GET /magensinus_contact/1
    def show
    end

    # GET /magensinus_contact/1/edit
    def edit
    end

    # PATCH/PUT /magensinus_contact/1
    def update
      if @magensinus_contact.update(magensinus_contact_params)
        redirect_to magensinus_contact_path, notice: 'Magensinus contact was successfully updated.'
      else
        render :edit
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_magensinus_contact
      @magensinus_contact = Magensinus::Contact.first!
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def magensinus_contact_params
      params.require(:magensinus_contact).permit(
        :slug,
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        :title,
        :description,
        :body
      )
    end
  end
end
