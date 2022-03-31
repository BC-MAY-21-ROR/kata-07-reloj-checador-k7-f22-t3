# frozen_string_literal: true

# Migration to create table attendances
class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.string :employee_private_number
      t.datetime :check_in
      t.datetime :check_out

      t.timestamps
    end
  end
end
