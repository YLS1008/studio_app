class RebuildGroupsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :groups
    drop_table :group_members
  end
end
