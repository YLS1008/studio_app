class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ticket, :integer
  end
end
