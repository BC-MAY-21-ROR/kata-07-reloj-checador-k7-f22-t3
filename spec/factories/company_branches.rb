# frozen_string_literal: true

FactoryBot.define do
  factory :company_branch do
    name { 'New york city' }
    address { Faker::Address.full_address }
  end
end
