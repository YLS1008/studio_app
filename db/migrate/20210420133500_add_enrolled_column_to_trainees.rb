class AddEnrolledColumnToTrainees < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :enrolled, :text
  end
end
