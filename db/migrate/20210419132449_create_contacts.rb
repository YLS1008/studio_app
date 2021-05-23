class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :first
      t.string :last
      t.string :type_of_contact
      t.string :phone
      t.string :interests

      t.timestamps
    end
  end
end
