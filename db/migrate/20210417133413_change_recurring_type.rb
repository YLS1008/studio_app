class ChangeRecurringType < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_slots, :recurring
    add_column :time_slots, :recurring, :boolean
  end
end
