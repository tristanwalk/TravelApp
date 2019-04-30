require "administrate/base_dashboard"

class PaymentManagerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    account: Field::HasOne,
    id: Field::Number,
    firstName: Field::String,
    lastName: Field::String,
    email: Field::String,
    password: Field::String,
    forms: Field::Text,
    empID: Field::Number,
    deptNum: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :account,
    :id,
    :firstName,
    :lastName,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :account,
    :id,
    :firstName,
    :lastName,
    :email,
    :password,
    :forms,
    :empID,
    :deptNum,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :account,
    :firstName,
    :lastName,
    :email,
    :password,
    :forms,
    :empID,
    :deptNum,
  ].freeze

  # Overwrite this method to customize how payment managers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(payment_manager)
  #   "PaymentManager ##{payment_manager.id}"
  # end
end
