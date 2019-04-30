json.extract! budget_approver, :id, :firstName, :lastName, :username, :email, :password, :forms, :empID, :deptNum, :created_at, :updated_at
json.url budget_approver_url(budget_approver, format: :json)
