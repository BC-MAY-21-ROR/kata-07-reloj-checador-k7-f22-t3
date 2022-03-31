# == Schema Information
#
# Table name: company_branches
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# frozen_string_literal: true

class CompanyBranch < ApplicationRecord
  has_many :employees
end
