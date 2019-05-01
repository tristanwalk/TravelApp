class HomeController < ApplicationController
  before_action :set_travel_authorizations_and_expense_reports, only: [:index]


  def pundit_user
    current_account
  end

  def index
    if current_account && current_account.accountable_type != "Employee"
      @travel_authorizations = TravelAuthorization.all
      @expense_reports = ExpenseReport.all
    end
    @sources = Source.all
    @expenses = Expense.all
    @departments = Department.all
    if current_account.empID == nil
      set_empID
    end

    if current_account && current_account.accountable_type == "Employee"
    respond_to do |format|
      format.html {
        if (params[:spa] && params[:spa] == "true")
          @spa = true
          render 'index_spa'
        else
          render 'index'
        end
      }
      format.json {render json: { travel_authorizations: @travel_authorizations, expense_reports: @expense_reports}}
      end
    end
    end

  private
  def set_empID
    current_account.empID = current_account.id
    current_account.accountable.empID = current_account.id
    current_account.accountable.empID
    current_account.save
  end

  def set_travel_authorizations_and_expense_reports
     if current_account && current_account.accountable_type != "SuperAccount"
      @travel_authorizations = TravelAuthorization.where(empID: current_account.empID)
      @expense_reports = ExpenseReport.where(empID: current_account.empID)
     end
  end
end
