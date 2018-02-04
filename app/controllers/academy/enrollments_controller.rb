# frozen_string_literal: true

module Academy
  class EnrollmentsController < ApplicationController
    before_action :set_academy_category
    before_action :set_academy_enrollment, only: [:show, :edit, :update, :destroy]

    # GET /academy/enrollments
    def index
      @academy_enrollments = @academy_category.enrollments.all
    end

    # GET /academy/enrollments/wrTyhg67Ty
    def show
    end

    # GET /academy/enrollments/wrTyhg67Ty/edit
    def edit
    end

    # PATCH/PUT /academy/enrollments/wrTyhg67Ty
    def update
      if @academy_enrollment.update(academy_enrollment_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_category_enrollments_path(@academy_category)
      else
        render :edit
      end
    end

    # DELETE /academy/enrollments/wrTyhg67Ty
    def destroy
      @academy_enrollment.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_category_enrollments_path(@academy_category)
    end

    # GET /academy/enrollments/new
    def new
      @academy_enrollment = @academy_category.enrollments.new
    end

    # POST /academy/enrollments
    def create
      @academy_enrollment = @academy_category.enrollments.new(academy_enrollment_params)

      if @academy_enrollment.save
        flash[:notice] = "Successfully created..."
        redirect_to academy_category_enrollments_path(@academy_category)
      else
        render :new
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_academy_category
      @academy_category = Academy::Category.find_by(slug: params[:category_id])
    end

    def set_academy_enrollment
      @academy_enrollment = @academy_category.enrollments.find_by(slug: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academy_enrollment_params
      params.require(:academy_enrollment).permit(
        :academy_category_id,
        :email
      )
    end
  end
end
