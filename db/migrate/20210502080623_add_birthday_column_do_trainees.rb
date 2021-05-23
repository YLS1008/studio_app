class AddBirthdayColumnDoTrainees < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :birthday, :date
    remove_column :trainees, :age
  end
end
