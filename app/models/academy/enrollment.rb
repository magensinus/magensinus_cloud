# frozen_string_literal: true

module Academy
  class Enrollment < ApplicationRecord
    # Table name
    # ----------
    # Academy enrollments
    self.table_name = "academy_enrollments"

    # Concerns
    # --------
    # Slug
    include Slug

    # Relationships
    # -------------
    # Category
    belongs_to :category, optional: true, foreign_key: "academy_category_id", inverse_of: false
    accepts_nested_attributes_for :category
    # Academy enrollment courses
    has_many :enrollment_courses, dependent: :destroy, foreign_key: "academy_enrollment_id", inverse_of: false
    accepts_nested_attributes_for :enrollment_courses
    # Academy courses
    has_many :courses, through: :enrollment_courses
    accepts_nested_attributes_for :courses

    # CSV
    # def self.to_csv
    #   CSV.generate(headers: false) do |csv|
    #     csv << column_names
    #     all.each do |product|
    #       csv << product.attributes.values_at(*column_names)
    #     end
    #   end
    # end

    def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << ["Date", "Name", "Surname", "Phone", "Email", "Category", "Courses"]
        all.each do |object|
          csv << [object.created_at.strftime("%d/%m/%Y"), object.name, object.surname, object.phone, object.email, object.category.title, object.enrollment_courses.map { |p| p.course.title }.join.html_safe]
        end
      end
    end
  end
end
