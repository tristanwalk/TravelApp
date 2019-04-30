json.extract! employee, :id, :firstName, :lastName, :username, :email, :password, :forms, :empID, :deptNum, :created_at, :updated_at
json.url employee_url(employee, format: :json)
