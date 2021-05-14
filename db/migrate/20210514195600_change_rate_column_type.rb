class ChangeRateColumnType < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :payment
    remove_column :contracts, :rate
    add_column :contracts, :rate, :integer
  end
end
