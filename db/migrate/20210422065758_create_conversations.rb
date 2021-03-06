class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :trainee, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
