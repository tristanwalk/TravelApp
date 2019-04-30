require "administrate/base_dashboard"

class TravelAuthorizationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    firstName: Field::String,
    lastName: Field::String,
    empID: Field::Number,
    tripNumber: Field::Number,
    deptNumber: Field::Number,
    formNumber: Field::Number,
    departureDate: Field::DateTime,
    submissionTime: Field::DateTime,
    returnDate: Field::DateTime,
    destination: Field::Text,
    purpose: Field::String,
    expenses: Field::Text,
    sources: Field::Text,
    status: Field::Boolean,
    updatetime: Field::DateTime,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :firstName,
    :lastName,
    :empID,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :firstName,
    :lastName,
    :empID,
    :tripNumber,
    :deptNumber,
    :formNumber,
    :departureDate,
    :submissionTime,
    :returnDate,
    :destination,
    :purpose,
    :expenses,
    :sources,
    :status,
    :updatetime,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :firstName,
    :lastName,
    :empID,
    :tripNumber,
    :deptNumber,
    :formNumber,
    :departureDate,
    :submissionTime,
    :returnDate,
    :destination,
    :purpose,
    :expenses,
    :sources,
    :status,
    :updatetime,
  ].freeze

  # Overwrite this method to customize how travel authorizations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(travel_authorization)
  #   "TravelAuthorization ##{travel_authorization.id}"
  # end
end
