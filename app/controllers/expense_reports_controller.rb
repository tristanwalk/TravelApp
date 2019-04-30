class ExpenseReportsController < ApplicationController
  before_action :set_expense_report, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def pundit_user
    current_account
  end

  # GET /expense_reports
  # GET /expense_reports.json
  def index
    @expense_reports = ExpenseReport.all
  end

  # GET /expense_reports/1
  # GET /expense_reports/1.json
  def show
    @expenses = @expense_report.expenses.all
    @sources = @expense_report.sources.all
    @receipts = @expense_report.receipts.all
  end

  # GET /expense_reports/new
  def new
    @expense_report = ExpenseReport.new
    @expense_report.expenses.build
    @expense_report.sources.build
    @expense_report.receipts.build
  end

  # GET /expense_reports/1/edit
  def edit
    @expenses = @expense_report.expenses.all
    @sources = @expense_report.sources.all
    @receipts = @expense_report.receipts.all

  end

  # POST /expense_reports
  # POST /expense_reports.json
  def create
    @expense_report = ExpenseReport.new(expense_report_params)

    respond_to do |format|
      if @expense_report.save
        format.html { redirect_to @expense_report, notice: 'Expense report was successfully created.' }
        format.json { render :show, status: :created, location: @expense_report }
      else
        format.html { render :new }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expense_reports/1
  # PATCH/PUT /expense_reports/1.json
  def update
    @expenses = @expense_report.expenses.all
    @sources = @expense_report.sources.all

    respond_to do |format|
      if @expense_report.update(expense_report_params)
        format.html { redirect_to @expense_report, notice: 'Expense report was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense_report }
        if @expense_report.status != "Approved"
          @expenses.each do |e|
            @sources = Source.where(expense_id: e.id)

            if @sources.all?{|s| s.approval == "Approved"}
              e.update_attribute(:approval, 'Approved' )
            #end
            elsif @sources.all?{|s| s.approval == "Denied"}
              e.update_attribute(:approval, 'Denied' )
            #end
            elsif @sources.any?{|s| s.approval == "Pending"}
              e.update_attribute(:approval, 'Pending' )
            else 
              e.update_attribute(:approval, 'Pending' )
            end
          end
          if @expenses.all?{|e| e.approval == "Approved"}
            @expense_report.update_attribute(:status, "Budget Approved, Final Approval Pending")
          elsif @expenses.all?{|e| e.approval == "Denied"}
            @expense_report.update_attribute(:status, "Denied")
          elsif @expenses.any?{|e| e.approval == "Pending"}
            @expense_report.update_attribute(:status, "Pending")
          else 
            @expense_report.update_attribute(:status, 'Pending' )
          end
        end
      else
        format.html { render :edit }
        format.json { render json: @expense_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expense_reports/1
  # DELETE /expense_reports/1.json
  def destroy
    @expense_report.destroy
    respond_to do |format|
      format.html { redirect_to expense_reports_url, notice: 'Expense report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense_report
      @expense_report = ExpenseReport.find(params[:id])
      if current_account && current_account.accountable_type == "Employee"
        if @expense_report.empID != current_account[:empID]
         invalid_expense_rep
        end
      end
      #@expense = @expense_report.expenses.find(id)
    end

    def invalid_travel_auth
      logger.error"Attempt to access invalid Expense Report"
      respond_to do |format|
        format.html { redirect_to home_index_url, notice: "Invalid Expense Report" }
        format.json { render json: {id: "invalid", line_items: [], total_price: 0} }
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_report_params
      params.require(:expense_report).permit(:tripNum, :firstName, :lastName, :empID, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose, :status, expenses_attributes:[:id, :expenseName, :expectedAmount, :actualAmount, :approval, :_destroy, receipts_attributes:[:id, :image_url, :_destroy], sources_attributes:[:id, :department, :amount, :approval, :_destroy]])
    end
end
