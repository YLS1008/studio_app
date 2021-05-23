class AddColumnToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :description, :text
    add_column :activities, :payment, :string
  end
end
