# frozen_string_literal: true

# Migration for table Branches creation
class CreateCompanyBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :company_branches do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
