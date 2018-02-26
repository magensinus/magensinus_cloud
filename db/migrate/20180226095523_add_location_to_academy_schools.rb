# frozen_string_literal: true

class AddLocationToAcademySchools < ActiveRecord::Migration[5.1]
  def change
    add_column :academy_schools, :eml, :boolean
    add_column :academy_schools, :magestil, :boolean
    add_column :academy_schools, :magensinus, :boolean
  end
end
