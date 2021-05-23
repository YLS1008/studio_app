class DropContractFromActivities < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :contract
    add_column :activities, :contract_type, :integer, default: 0
  end
end
