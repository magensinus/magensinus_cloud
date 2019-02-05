# frozen_string_literal: true

class AddVideoToAcademyCourses < ActiveRecord::Migration[5.2]
  def change
    # video
    add_column :academy_courses, :video, :boolean
    add_column :academy_courses, :video_box, :string
    add_column :academy_courses, :video_caption, :string
    add_column :academy_courses, :video_service, :string
    # video eml
    add_column :academy_courses, :video_eml, :boolean
    add_column :academy_courses, :video_box_eml, :string
    add_column :academy_courses, :video_caption_eml, :string
    add_column :academy_courses, :video_service_eml, :string
    # video magestil
    add_column :academy_courses, :video_magestil, :boolean
    add_column :academy_courses, :video_box_magestil, :string
    add_column :academy_courses, :video_caption_magestil, :string
    add_column :academy_courses, :video_service_magestil, :string
    # video magensinus
    add_column :academy_courses, :video_magensinus, :boolean
    add_column :academy_courses, :video_box_magensinus, :string
    add_column :academy_courses, :video_caption_magensinus, :string
    add_column :academy_courses, :video_service_magensinus, :string
  end
end
