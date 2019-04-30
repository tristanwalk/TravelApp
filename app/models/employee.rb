class Employee < ApplicationRecord
	has_one :account, as: :accountable
  has_many :travel_authorizations
  has_many :expense_reports
end
