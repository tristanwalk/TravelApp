require "administrate/base_dashboard"

class ExpenseReportDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    reciepts: Field::Text,
    tripNum: Field::Number,
    firstName: Field::String,
    lastName: Field::String,
    empID: Field::Number,
    deptNum: Field::Number,
    formNum: Field::Number,
    deptDate: Field::DateTime,
    submissionTime: Field::DateTime,
    destination: Field::Text,
    purpose: Field::String,
    expenses: Field::Text,
    sources: Field::Text,
    status: Field::Boolean,
    updateTime: Field::DateTime,
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
    :reciepts,
    :tripNum,
    :firstName,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :reciepts,
    :tripNum,
    :firstName,
    :lastName,
    :empID,
    :deptNum,
    :formNum,
    :deptDate,
    :submissionTime,
    :destination,
    :purpose,
    :expenses,
    :sources,
    :status,
    :updateTime,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :reciepts,
    :tripNum,
    :firstName,
    :lastName,
    :empID,
    :deptNum,
    :formNum,
    :deptDate,
    :submissionTime,
    :destination,
    :purpose,
    :expenses,
    :sources,
    :status,
    :updateTime,
  ].freeze

  # Overwrite this method to customize how expense reports are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(expense_report)
  #   "ExpenseReport ##{expense_report.id}"
  # end
end
