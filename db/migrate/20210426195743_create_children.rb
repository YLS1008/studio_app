class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :trainee, index: true, foreign_key: true
      t.integer :child_trainee_id
      t.timestamps
    end
  end
end
