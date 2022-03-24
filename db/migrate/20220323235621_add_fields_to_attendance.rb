class AddFieldsToAttendance < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :employee, null: false, foreign_key: true
    remove_column :attendances, :employee_private_number
  end
end
