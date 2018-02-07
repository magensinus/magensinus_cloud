# frozen_string_literal: true

module Academy
  module SectionAssetHelper
    include ApplicationHelper

    # Academy section asset form url
    def academy_section_asset_form_url
      if params_new || params_create
        academy_course_section_section_assets_path
      else
        academy_course_section_section_asset_path
      end
    end
  end
end
