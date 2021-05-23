class AddColumnToInstructors < ActiveRecord::Migration[6.1]
  def change
    add_column :instructors, :description, :text
    add_column :instructors, :speciality, :string
    add_column :instructors, :exp, :string
  end
end
