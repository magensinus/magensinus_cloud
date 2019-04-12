# frozen_string_literal: true

module Academy
  module CoursesHelper
    def courses_back_url
      if params[:category_id]
        academy_category_path(@academy_category)
      else
        academy_root_path
      end
    end
  end
end
