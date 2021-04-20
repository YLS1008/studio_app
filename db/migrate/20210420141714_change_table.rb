class ChangeTable < ActiveRecord::Migration[6.1]
  def change
    remove_column :time_slots, :enrolled
    remove_column :trainees, :enrolled

    add_column :time_slots, :enrolled, :string
    add_column :time_slots, :occupancy, :integer, default: 0
    add_column :trainees, :enrolled, :string

  end
end

