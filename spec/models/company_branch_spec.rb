require 'rails_helper'

describe CompanyBranch do
  it 'is valid with name, address' do
    company_branch = create(:company_branch)
    expect(company_branch).to be_valid
  end

  it 'is invalid without a name' do
    company_branch = create(:company_branch)
    company_branch.name = nil
    expect(company_branch).not_to be_valid
  end

  it 'is invalid without an address' do
    company_branch = create(:company_branch)
    company_branch.address = nil
    expect(company_branch).not_to be_valid
  end

  it 'is invalid with a duplicate name' do
    CompanyBranch.new(
      name: 'El patito feo',
      address: Faker::Address.full_address
    ).save
    company_branch = CompanyBranch.new(
      name: 'El patito feo',
      address: Faker::Address.full_address
    )
    expect(company_branch).not_to be_valid
  end
end
