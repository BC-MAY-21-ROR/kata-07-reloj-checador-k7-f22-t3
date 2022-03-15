class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :position
      t.integer :employee_number
      t.string :private_number

      t.timestamps
    end
  end
end
