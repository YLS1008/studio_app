class AddContractToActivities < ActiveRecord::Migration[6.1]
  def change
    add_column :activities, :contract, :string
  end
end
