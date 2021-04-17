class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.references :activity, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :enrolled
      t.text :recurring

      t.timestamps
    end
  end
end
