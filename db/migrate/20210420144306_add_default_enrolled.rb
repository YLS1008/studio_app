class AddDefaultEnrolled < ActiveRecord::Migration[6.1]
  def change
    change_column_default :trainees, :enrolled, ""
  end
end
