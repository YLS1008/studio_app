class CreateEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :enrollments do |t|
      t.references :trainee, index: true, foreign_key: true
      t.references :time_slot, index: true, foreign_key: true

      t.timestamps
    end
  end
end
