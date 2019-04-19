class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end


  # GET /expenses/new
  def new
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.new
  end

  def show
    @trip = Trip.find(params[:trip_id])
  end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save!
        format.html { redirect_to "/trips/#{@expense.trip.id}", notice: 'Expense was successfully created.' }
      else
        format.html { redirect_to "/trips/#{@expense.trip.id}" }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :notes, :expense_date, :expense_category_id, :trip_id)
    end
end
