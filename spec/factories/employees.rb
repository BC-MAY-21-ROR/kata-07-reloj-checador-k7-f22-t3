FactoryBot.define do
    factory :employee do
        name { Faker::Name.name }
        position { Faker::Job.position }
        email { Faker::Internet.email }
        employee_number { Faker::Number.number(digits: 5) }
        private_number { Faker::Number.number(digits: 6) }
        company_branch_id { CompanyBranch.last.id }
    end
end