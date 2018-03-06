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
