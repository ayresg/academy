class AddAssociationsToDeptsAndCourses < ActiveRecord::Migration[5.1]
  def change
    # add course number column to courses
    add_column :courses, :number, :smallint
    # set up join table
    create_table :course_depts do |t|
      t.belongs_to :course, index: true
      t.belongs_to :department, index: true
    end
  end
end