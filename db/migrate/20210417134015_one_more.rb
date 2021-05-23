class OneMore < ActiveRecord::Migration[6.1]
  def change
    change_column_default :time_slots, :recurring, true
  end
end
