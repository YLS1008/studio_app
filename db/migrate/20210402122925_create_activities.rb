class CreateActivities < ActiveRecord::Migration[6.1]
  def change
    create_table :activities do |t|
      t.references :instructor, null: false, foreign_key: true
      t.string :name
      t.integer :duration
      t.datetime :start_time
      t.datetime :end_time
      t.integer :capacity
      t.text :reccuring

      t.timestamps
    end
  end
end
