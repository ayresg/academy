class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :codes, array: true, default: []
      t.string :description
    end
  end
end
