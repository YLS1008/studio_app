class OneMoreLastTime < ActiveRecord::Migration[6.1]
  def change
    change_column_default :time_slots, :enrolled, 0
  end
end
