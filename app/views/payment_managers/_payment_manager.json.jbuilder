json.extract! payment_manager, :id, :firstName, :lastName, :username, :email, :password, :forms, :empID, :created_at, :updated_at
json.url payment_manager_url(payment_manager, format: :json)
