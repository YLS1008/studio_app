class CreateChildren < ActiveRecord::Migration[6.1]
  def change
    create_table :children do |t|
      t.references :trainee, null: false, foreign_key: true
      t.string :name
      t.integer :age
      t.string :enrolled, default: ""

      t.timestamps
    end
  end
end
