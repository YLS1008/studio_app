class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :trainee, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
