class ChangeTraineesTable < ActiveRecord::Migration[6.1]
  def change
    add_column :trainees, :age, :integer
    remove_column :trainees, :enrolled
  end
end
