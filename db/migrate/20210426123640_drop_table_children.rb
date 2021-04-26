class DropTableChildren < ActiveRecord::Migration[6.1]
  def change
    drop_table :children_enrollments
    drop_table :children
  end
end
