class UpdateChildrenLogic2 < ActiveRecord::Migration[6.1]
  def change
    remove_column :trainees, :has_child
    remove_column :trainees, :has_parent
    add_column :trainees, :child_id, :integer, default: 0
    add_column :trainees, :parent_id, :integer, default: 0
  end
end
