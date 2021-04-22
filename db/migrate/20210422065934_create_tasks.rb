class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.references :trainee, null: false, foreign_key: true
      t.text :description
      t.datetime :deadline
      t.integer :status

      t.timestamps
    end
  end
end
