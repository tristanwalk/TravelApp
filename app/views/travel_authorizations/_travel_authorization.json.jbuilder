json.extract! travel_authorization, :id, :firstName, :lastName, :empID, :tripNum, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose, :status, :created_at, :updated_at
json.url travel_authorization_url(travel_authorization, format: :json)
