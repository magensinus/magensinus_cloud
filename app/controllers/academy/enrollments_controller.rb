# frozen_string_literal: true

module Academy
  class EnrollmentsController < ApplicationController
    # Callbacks
    # ---------
    # Academy category
    before_action :academy_category
    # Academy course
    before_action :academy_courses, only: [:new, :create, :edit, :update]
    # Academy enrollment
    before_action :academy_enrollment, only: [:show, :edit, :update, :destroy]

    # Index
    # -----
    def index
      @academy_enrollments =
        if params[:category_id]
          @academy_category.enrollments.includes(:category).all
        else
          Academy::Enrollment.includes(:category).all
        end
    end

    # Show
    # ----
    def show
      @academy_courses = @academy_enrollment.enrollment_courses.includes(:course).all
    end

    # Edit
    # ----
    def edit
    end

    # Update
    # ------
    def update
      if @academy_enrollment.update(academy_enrollment_params)
        flash[:notice] = "Successfully updated..."
        redirect_to academy_category_enrollments_path(@academy_category)
      else
        render :edit
      end
    end

    # Destroy
    # -------
    def destroy
      @academy_enrollment.destroy
      flash[:notice] = "Successfully destroyed..."
      redirect_to academy_category_enrollments_path(@academy_category)
    end

    # New
    # ---
    def new
      @academy_enrollment = @academy_category.enrollments.new
    end

    # Create
    # ------
    def create
      @academy_enrollment = @academy_category.enrollments.new(academy_enrollment_params)
      if @academy_enrollment.save
        # send_enrollment_email
        flash[:notice] = "Successfully created..."
        redirect_to academy_category_enrollments_path(@academy_category)
      else
        render :new
      end
    end

    private

    # Academy category
    def academy_category
      @academy_category = Academy::Category.find_by(slug: params[:category_id])
    end

    # Academy courses
    def academy_courses
      @academy_courses = @academy_category.courses.all
    end

    # Academy enrollment
    def academy_enrollment
      @academy_enrollment = @academy_category.enrollments.find_by(slug: params[:id])
    end

    # Send enrollment email
    def send_enrollment_email
      client = Postmark::ApiClient.new(ENV["POSTMARK_TOKEN"])
      client.deliver_with_template(
        from: ENV["POSTMARK_NOTIFICATIONS_EMAIL"],
        to: @academy_category.email,
        template_id: "4858883",
        template_model: {
          courses: [{
            title: "The Title"
          }]
        },
        tag: "enrollment"
      )
    end

    # Whitelist params
    def academy_enrollment_params
      params.require(:academy_enrollment).permit(
        # Relationships
        :academy_category_id,
        # Misc
        :name,
        :surname,
        :dob,
        :email,
        :phone,
        :address_one,
        :address_two,
        :postcode,
        :city,
        :country,
        :secondary_name,
        :secondary_surname,
        :secondary_email,
        :secondary_phone,
        :accept_terms,
        # Collections
        course_ids: []
      )
    end
  end
end
