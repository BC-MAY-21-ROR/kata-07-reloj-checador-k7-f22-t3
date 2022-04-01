# frozen_string_literal: true

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
  has_many :attendances, dependent: :destroy

  validates :name, :email, :position, :employee_number, :private_number, presence: true
  validates :email, uniqueness: true
  validates :private_number, uniqueness: true
  validates :employee_number, uniqueness: true

  scope :actives, -> { where(is_active: true) }

  def absence_by_month
    DateTime.now.day - attendances.where(
      'check_in BETWEEN ? AND ?',
      DateTime.now.beginning_of_month,
      DateTime.now.end_of_month
    ).count
  end

  def today_attendance?
    !attendances.where(check_in: Date.today.all_day).first.nil?
  end

  def average
    month_attendances = attendances.where('check_in BETWEEN ? AND ?', DateTime.now.beginning_of_month, DateTime.now.end_of_month)
    average_seconds = (month_attendances.collect{|att| att.check_out ? att.check_out - att.check_in : 0}.sum / DateTime.now.day).to_i
    Time.at(average_seconds).utc.strftime("%H:%M:%S")
  end
end
