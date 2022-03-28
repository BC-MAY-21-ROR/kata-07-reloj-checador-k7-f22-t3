# == Schema Information
#
# Table name: employees
#
#  id                :bigint           not null, primary key
#  name              :string
#  email             :string
#  position          :string
#  employee_number   :integer
#  private_number    :string
#  company_branch_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Employee < ApplicationRecord
  belongs_to :company_branch
  has_many :attendances
  
  validates :name, :email, :position, :employee_number, :private_number, :company_branch_id, presence: true
  validates :email, uniqueness: true
  validates :private_number, uniqueness: true
  validates :employee_number, uniqueness: true
end
