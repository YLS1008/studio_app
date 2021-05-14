class AddDefaultRateTypeToActivities < ActiveRecord::Migration[6.1]
  def change
    change_column_default :contracts, :rate_type, 0
  end
end
