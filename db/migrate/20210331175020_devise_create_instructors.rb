# frozen_string_literal: true

class DeviseCreateInstructors < ActiveRecord::Migration[6.1]
  def change
    create_table :instructors do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at     

      t.timestamps null: false

      t.string :first, null: false, default: ""
      t.string :last, null: false, default: ""
      t.string :phone, null: false, default: ""
    end

    add_index :instructors, :email,                unique: true
    add_index :instructors, :reset_password_token, unique: true
  end
end
