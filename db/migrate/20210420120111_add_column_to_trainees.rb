class AddColumnToTrainees < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :ticket, :integer
    change_column_default :trainees, :ticket, 0

  end
end
