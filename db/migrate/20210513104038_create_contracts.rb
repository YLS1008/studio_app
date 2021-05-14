class CreateContracts < ActiveRecord::Migration[6.1]
  def change
    create_table :contracts do |t|
      t.references :activity, null: false, foreign_key: true
      t.integer :rate_type
      t.string :rate

      t.timestamps
    end

    remove_column :activities, :contract_type
  end
end
