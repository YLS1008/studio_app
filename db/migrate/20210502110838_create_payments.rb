class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :trainee, null: false, foreign_key: true
      t.integer :sum
      t.integer :number_of_tickets

      t.timestamps
    end
  end
end
