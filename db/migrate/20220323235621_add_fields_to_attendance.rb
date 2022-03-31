# frozen_string_literal: true

# Add and remove columns to existing table
class AddFieldsToAttendance < ActiveRecord::Migration[7.0]
  def change
    add_reference :attendances, :employee, foreign_key: true
    remove_column :attendances, :employee_private_number, :integer
  end
end
