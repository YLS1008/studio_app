class CreateChildrenEnrollments < ActiveRecord::Migration[6.1]
  def change
    create_table :children_enrollments do |t|
      t.references :child, index: true, foreign_key: true
      t.references :time_slot, index: true, foreign_key: true

      t.timestamps
    end
  end
end
