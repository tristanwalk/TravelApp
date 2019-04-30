json.extract! department, :id, :currentBudget, :totalBudget, :name, :deptNum, :created_at, :updated_at
json.url department_url(department, format: :json)
