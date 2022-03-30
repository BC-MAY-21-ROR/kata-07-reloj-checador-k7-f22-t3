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
#  is_active         :boolean
#
class Employee < ApplicationRecord
  belongs_to :company_branch
  has_many :attendances

  scope :actives, -> { where(is_active: true) }

  def absence_by_month
    attendances.where.not(check_in: nil).where('check_in BETWEEN ? AND ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month).count
  end

  def today_attendance?
    attendances.where(check_in: Date.today.all_day).first.nil? ? false : true
  end
  
  validates :name, :email, :position, :employee_number, :private_number, :company_branch_id, presence: true
  validates :email, uniqueness: true
  validates :private_number, uniqueness: true
  validates :employee_number, uniqueness: true
end
