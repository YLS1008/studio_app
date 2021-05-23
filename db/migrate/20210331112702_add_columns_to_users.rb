class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :phone, :string
  end
end
