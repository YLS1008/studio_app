class AddInfoColumnToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :info, :text
  end
end
