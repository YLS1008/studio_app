class CreateMonthlyPayments < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_payments do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :trainee, null: false, foreign_key: true
      t.integer :sum
      t.integer :month

      t.timestamps
    end
  end
end
