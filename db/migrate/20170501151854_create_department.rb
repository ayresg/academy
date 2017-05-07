class CreateDepartment < ActiveRecord::Migration[5.1]
  def up
  	create_table :departments do |t|
      t.string :name
      t.string :page_address
      t.string :header_image_name
      t.string :abbrev
  	end
  end

  def down
  	drop_table :departments
  end
end
