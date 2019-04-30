class TravelAuthorizationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_travel_authorization, only: [:show, :edit, :update, :destroy]

  def pundit_user
    current_account
  end

  # GET /travel_authorizations
  # GET /travel_authorizations.json
  def index
    @travel_authorizations = TravelAuthorization.all
    @all_expenses = Expense.all
    @all_sources = Source.all
  end

  # GET /travel_authorizations/1
  # GET /travel_authorizations/1.json
  def show
    @expenses = @travel_authorization.expenses.all
    @sources = @travel_authorization.sources.all
  end

  # GET /travel_authorizations/new
  def new
    @travel_authorization = TravelAuthorization.new
    @travel_authorization.expenses.build
    @travel_authorization.sources.build
  end

  # GET /travel_authorizations/1/edit
  def edit
    @expenses = @travel_authorization.expenses.all
    @sources = @travel_authorization.sources.all
  end

  # POST /travel_authorizations
  # POST /travel_authorizations.json
  def create
    @travel_authorization = TravelAuthorization.new(travel_authorization_params)

    respond_to do |format|
      if @travel_authorization.save
        format.html { redirect_to @travel_authorization, notice: 'Travel authorization was successfully created.' }
        format.json { render :show, status: :created, location: @travel_authorization }
      else
        format.html { render :new }
        format.json { render json: @travel_authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /travel_authorizations/1
  # PATCH/PUT /travel_authorizations/1.json
  def update
    @expenses = @travel_authorization.expenses.all
    @sources = @travel_authorization.sources.all

    respond_to do |format|
      if @travel_authorization.update(travel_authorization_params)
        format.html { redirect_to @travel_authorization, notice: 'Travel authorization was successfully updated.' }
        format.json { render :show, status: :ok, location: @travel_authorization }
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
          @travel_authorization.update_attribute(:status, "Approved")
        elsif @expenses.all?{|e| e.approval == "Denied"}
          @travel_authorization.update_attribute(:status, "Denied")
        elsif @expenses.any?{|e| e.approval == "Pending"}
          @travel_authorization.update_attribute(:status, "Pending")
        else 
          @travel_authorization.update_attribute(:status, 'Pending' )
        end

      else
        format.html { render :edit }
        format.json { render json: @travel_authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /travel_authorizations/1
  # DELETE /travel_authorizations/1.json
  def destroy
    @travel_authorization.destroy
    respond_to do |format|
      format.html { redirect_to travel_authorizations_url, notice: 'Travel authorization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_travel_authorization
      @travel_authorization = TravelAuthorization.find(params[:id])

      if current_account && current_account.accountable_type == "Employee"
        if @travel_authorization.empID != current_account[:empID]
          invalid_travel_auth
        end
      end
    end
    def invalid_travel_auth
      logger.error"Attempt to access invalid travel authorization"
      respond_to do |format|
        format.html { redirect_to home_index_url, notice: "Invalid Travel Authorization" }
        format.json { render json: {id: "invalid", line_items: [], total_price: 0} }
      end 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def travel_authorization_params
      params.require(:travel_authorization).permit(:statusBA, :firstName, :lastName, :empID, :tripNum, :deptNum, :formNum, :departDate, :returnDate, :destination, :purpose, :status, sources_attributes:[:id, :department, :amount, :approval, :_destroy], expenses_attributes:[:id, :expenseName, :expectedAmount, :actualAmount, :approval, :_destroy, sources_attributes:[:id, :department, :amount, :approval, :_destroy]])
    end
end
