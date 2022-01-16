class AddEducationAndEmploymentStatusToAcademyEnrollments < ActiveRecord::Migration[5.2]
  def change
    add_column :academy_enrollments, :education, :string
    add_column :academy_enrollments, :employment_status, :string
  end
end
