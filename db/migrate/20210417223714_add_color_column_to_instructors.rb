class AddColorColumnToInstructors < ActiveRecord::Migration[6.1]
  def change
    add_column :instructors, :color, :string
  end
end
