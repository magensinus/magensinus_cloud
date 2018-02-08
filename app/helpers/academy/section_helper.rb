# frozen_string_literal: true

module Academy
  module SectionHelper
    # Academy section form url
    def academy_section_form_url
      if params_new || params_create
        academy_course_sections_path
      else
        academy_course_section_path
      end
    end
  end
end
