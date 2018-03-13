# frozen_string_literal: true

class AddExternalToAcademyCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :academy_courses, :external, :boolean
    add_column :academy_courses, :url, :string
  end
end
