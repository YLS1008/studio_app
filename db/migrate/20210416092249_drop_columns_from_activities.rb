class DropColumnsFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :start_time
    remove_column :activities, :end_time
    remove_column :activities, :reccuring
  end
end
