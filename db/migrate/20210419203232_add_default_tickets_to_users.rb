class AddDefaultTicketsToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :ticket, 0
  end
end
