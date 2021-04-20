class CreateTrainees < ActiveRecord::Migration[6.1]
  def change
    create_table :trainees do |t|
      t.string :email
      t.string :first
      t.string :last
      t.string :phone

      t.timestamps
    end
  end
end
