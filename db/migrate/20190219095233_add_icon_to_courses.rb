# frozen_string_literal: true

class AddIconToCourses < ActiveRecord::Migration[5.2]
  def change
    # Icon
    add_column :academy_courses, :icon, :boolean
    add_column :academy_courses, :icon_box, :string
    # Icon Eml
    add_column :academy_courses, :icon_eml, :boolean
    add_column :academy_courses, :icon_box_eml, :string
    # Icon Magestil
    add_column :academy_courses, :icon_magestil, :boolean
    add_column :academy_courses, :icon_box_magestil, :string
    # Icon Magensinus
    add_column :academy_courses, :icon_magensinus, :boolean
    add_column :academy_courses, :icon_box_magensinus, :string
    # Caption
    add_column :academy_courses, :icon_caption, :string
  end
end
