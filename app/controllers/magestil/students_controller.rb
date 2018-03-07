# frozen_string_literal: true

module Magestil
  class StudentsController < ApplicationController
    # Callbacks
    # ---------
    # Magestil students
    before_action :magestil_students, only: [:show, :edit, :update]

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
      if @magestil_students.update(magestil_students_params)
        flash[:notice] = "Successfully updated..."
        redirect_to magestil_students_path
      else
        render :edit
      end
    end

    private

    # Magestil students
    def magestil_students
      @magestil_students = Magestil::Students.first!
    end

    # Whitelist params
    def magestil_students_params
      params.require(:magestil_students).permit(
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
