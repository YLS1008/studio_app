class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.references :user, null: true
      t.references :instructor, null: true
      t.references :admin, null: true
      t.boolean :seen
      t.text :content
      t.string :level

      t.timestamps
    end
  end
end
