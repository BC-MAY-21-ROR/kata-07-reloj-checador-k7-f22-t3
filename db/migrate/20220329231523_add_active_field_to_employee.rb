# frozen_string_literal: true

# Migration to create table employees
class AddActiveFieldToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :is_active, :boolean, default: true
  end
end
