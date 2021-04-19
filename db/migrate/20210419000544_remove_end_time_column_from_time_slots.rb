class RemoveEndTimeColumnFromTimeSlots < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_slots, :end_time
  end
end
