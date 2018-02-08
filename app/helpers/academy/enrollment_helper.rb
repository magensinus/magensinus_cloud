# frozen_string_literal: true

module Academy
  module EnrollmentHelper
    # Academy enrollment form url
    def academy_enrollment_form_url
      if params_new || params_create
        academy_category_enrollments_path
      else
        academy_category_enrollment_path
      end
    end
  end
end
