# frozen_string_literal: true

module Magestil
  class TermsAndConditionsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil terms_and_conditions
    before_action :magestil_terms_and_conditions, only: [:show, :edit, :update]

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
      if @magestil_terms_and_conditions.update(magestil_terms_and_conditions_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_terms_and_conditions_path
      else
        render :edit
      end
    end

    private

    # Magestil terms_and_conditions
    def magestil_terms_and_conditions
      @magestil_terms_and_conditions = Magestil::TermsAndConditions.first!
    end

    # Whitelist params
    def magestil_terms_and_conditions_params
      params.require(:magestil_terms_and_conditions).permit(
        # Meta tags
        :meta_title,
        :meta_description,
        :meta_image_box,
        :meta_url,
        # Misc
        :title,
        :description,
        :body,
        # Image
        :image,
        :image_box,
        :remove_image_box,
        :image_box_cache,
        :image_caption,
        # Document
        :document,
        :document_box,
        :remove_document_box,
        :document_box_cache,
        :document_caption
      )
    end
  end
end
