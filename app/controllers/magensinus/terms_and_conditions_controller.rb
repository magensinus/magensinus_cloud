# frozen_string_literal: true

module Magensinus
  class TermsAndConditionsController < ApplicationController
    # Callbacks
    # ---------
    # Magensinus terms_and_conditions
    before_action :magensinus_terms_and_conditions, only: [:show, :edit, :update]

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
      if @magensinus_terms_and_conditions.update(magensinus_terms_and_conditions_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magensinus_terms_and_conditions_path
      else
        render :edit
      end
    end

    private

    # Magensinus terms_and_conditions
    def magensinus_terms_and_conditions
      @magensinus_terms_and_conditions = Magensinus::TermsAndConditions.first!
    end

    # Whitelist params
    def magensinus_terms_and_conditions_params
      params.require(:magensinus_terms_and_conditions).permit(
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
