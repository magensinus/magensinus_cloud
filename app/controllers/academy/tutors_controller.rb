# frozen_string_literal: true

module Academy
  class TutorsController < ApplicationController
    # Params
    # ------
    # Image
    include ImageParams

    # Callbacks
    # ---------
    # Academy tutor
    before_action :academy_tutor, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_tutors = Academy::Tutor.all
    end

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
      if @academy_tutor.update(academy_tutor_params)
        flash[:notice] = "Successfully updated..."
        redirect_to @academy_tutor
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @academy_tutor.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_tutors_url
    end

    # New
    # ---
    def new
      @academy_tutor = Academy::Tutor.new
    end

    # Create
    # ------
    def create
      @academy_tutor = Academy::Tutor.new(academy_tutor_params)
      if @academy_tutor.save
        flash[:notice] = "Successfully created..."
        redirect_to @academy_tutor
      else
        render :new
      end
    end

    private

    # Academy tutor
    def academy_tutor
      @academy_tutor = Academy::Tutor.find_by(slug: params[:id])
    end

    # Whitelist params
    def academy_tutor_params
      params.require(:academy_tutor).permit(
        image_params,
        :name,
        :surname,
        :biography,
        :position
      )
    end
  end
end
