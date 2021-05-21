class UpdateChildrenLogic < ActiveRecord::Migration[6.1]
  def change
    drop_table :children
    add_column :trainees, :has_child, :boolean, default: false
    add_column :trainees, :has_parent, :boolean, default: false
  end
end
