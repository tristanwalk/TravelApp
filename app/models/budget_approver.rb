class BudgetApprover < ApplicationRecord
	has_one :account, as: :accountable
end
