class DataController < ApplicationController
	
  def pundit_user
    current_account
  end
  def index
    @travel_authorizations = TravelAuthorization.all
    @expense_reports = ExpenseReport.all
  end

end
