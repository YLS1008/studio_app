class AddActiveToTrainees < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :active, :boolean, default: true
  end
end
