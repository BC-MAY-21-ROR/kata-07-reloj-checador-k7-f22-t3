# Add unique index
class AddIndexToEmployeeFields < ActiveRecord::Migration[7.0]
  def change
    add_index :employees, :email, unique: true
    add_index :employees, :employee_number, unique: true
    add_index :employees, :private_number, unique: true
  end
end
