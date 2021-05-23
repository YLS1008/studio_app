class AddLockedToTimeSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slots, :locked, :boolean, default: false
  end
end
