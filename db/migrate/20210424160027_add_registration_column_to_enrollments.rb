class AddRegistrationColumnToEnrollments < ActiveRecord::Migration[6.1]
  def change
    add_column :enrollments, :registration, :string, default: "ticket"
  end
end
