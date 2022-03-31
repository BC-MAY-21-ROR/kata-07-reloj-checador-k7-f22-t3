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
#
require 'rails_helper'

describe Employee do
  before(:each) do
    @company_branch = create(:company_branch)
  end

  it 'is valid with name, email, position, employee_number, private_number and company_branch_id' do
    employee = create(:employee)
    employee.company_branch = @company_branch
    expect(employee).to be_valid
  end

  it 'is invalid without a name' do
    employee = create(:employee)
    employee.name = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid without an email address' do
    employee = create(:employee)
    employee.email = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid without a position' do
    employee = create(:employee)
    employee.position = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid without a employee_number' do
    employee = create(:employee)
    employee.employee_number = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid without a private_number' do
    employee = create(:employee)
    employee.private_number = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid without a company_branch_id' do
    employee = create(:employee)
    employee.company_branch_id = nil
    expect(employee).not_to be_valid
  end

  it 'is invalid with a duplicate email address' do
    Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position, email: 'test@mail.com',
      employee_number: Faker::Number.number(digits: 5),
      private_number: Faker::Number.number(digits: 6),
      company_branch_id: CompanyBranch.last.id
    ).save
    employee = Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position,
      email: 'test@mail.com',
      employee_number: Faker::Number.number(digits: 5),
      private_number: Faker::Number.number(digits: 6),
      company_branch_id: CompanyBranch.last.id
    )
    expect(employee).not_to be_valid
  end

  it 'is invalid with a duplicate private_number' do
    Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position,
      email: Faker::Internet.email,
      employee_number: Faker::Number.number(digits: 5),
      private_number: 123_456,
      company_branch_id: CompanyBranch.last.id
    ).save

    employee = Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position,
      email: Faker::Internet.email,
      employee_number: Faker::Number.number(digits: 5),
      private_number: 123_456,
      company_branch_id: CompanyBranch.last.id
    )
    expect(employee).not_to be_valid
  end

  it 'is invalid with a duplicate employee_number' do
    Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position,
      email: Faker::Internet.email,
      employee_number: 12_345,
      private_number: Faker::Number.number(digits: 6),
      company_branch_id: CompanyBranch.last.id
    ).save
    employee = Employee.new(
      name: Faker::Name.name,
      position: Faker::Job.position,
      email: Faker::Internet.email,
      employee_number: 12_345,
      private_number: Faker::Number.number(digits: 6),
      company_branch_id: CompanyBranch.last.id
    )
    expect(employee).not_to be_valid
  end
end
