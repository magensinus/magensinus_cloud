# frozen_string_literal: true

module Academy
  class TutorsController < ApplicationController
    # Callbacks
    # ---------
    # Academy tutor
    before_action :academy_tutor, only: [:show, :edit, :update, :destroy]

    # GET /academy/tutors
    def index
      @academy_tutors = Academy::Tutor.all
    end

    # GET /academy/tutors/1
    def show
    end

    # GET /academy/tutors/1/edit
    def edit
    end

    # PATCH/PUT /academy/tutors/1
    def update
      if @academy_tutor.update(academy_tutor_params)
        flash[:notice] = "Successfully updated..."
        redirect_to @academy_tutor
      else
        render :edit
      end
    end

    # DELETE /academy/tutors/1
    def destroy
      @academy_tutor.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_tutors_url
    end

    # GET /academy/tutors/new
    def new
      @academy_tutor = Academy::Tutor.new
    end

    # POST /academy/tutors
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

    # Whitelist parameters
    def academy_tutor_params
      params.require(:academy_tutor).permit(
        :name,
        :surname,
        :biography,
        :image,
        :image_box,
        :image_caption,
        :position
      )
    end
  end
end
