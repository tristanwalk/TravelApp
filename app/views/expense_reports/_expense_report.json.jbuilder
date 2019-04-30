json.extract! expense_report, :id, :receipts, :tripNum, :firstName, :lastName, :empID, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose, :expenses, :sources, :status, :created_at, :updated_at
json.url expense_report_url(expense_report, format: :json)
