# frozen_string_literal: true

class CreateAcademyEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :academy_enrollments do |t|
      # Relationships
      # Academy category
      t.references  :academy_category, foreign_key: true, index: true

      t.string      :slug, unique: true, index: true

      t.string      :name
      t.string      :surname
      t.date        :dob

      t.string      :email
      t.string      :phone

      t.string      :address_one
      t.string      :address_two
      t.string      :postcode
      t.string      :city
      t.string      :country

      t.string      :secondary_name
      t.string      :secondary_surname
      t.string      :secondary_email
      t.string      :secondary_phone

      t.boolean     :accept_terms, default: true

      t.timestamps
    end
  end
end
