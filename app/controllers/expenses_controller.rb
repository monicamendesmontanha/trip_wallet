class ExpensesController < ApplicationController
  before_action :check_login!

  def index
    @expenses = Expense.all
  end


  # GET /expenses/new
  def add
    @trip = Trip.find(params[:trip_id])
    @expense = Expense.new
  end

  def history
    @trip = Trip.find(params[:trip_id])
  end

  def chart
    @trip = Trip.find(params[:trip_id])

    total_by_categories = @trip.expenses_by_category

    @data = {
      labels: total_by_categories.keys,
      datasets: [
        {
            label: "Expense Category",
            backgroundColor: "rgba(220,220,220,0.2)",
            borderColor: "rgba(220,220,220,1)",
            data: total_by_categories.values,
        }
      ]
    }
  end

  def create
    @expense = Expense.new(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to trip_path(@expense.trip.id), notice: 'Expense was successfully created.' }
      else
        format.html { redirect_to trip_path(@expense.trip.id), flash: { errors: @expense.errors.full_messages } }
      end
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    respond_to do |format|
      format.html { redirect_to history_expense_path(expense.trip.id), notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :notes, :expense_date, :expense_category_id, :trip_id)
    end
end
