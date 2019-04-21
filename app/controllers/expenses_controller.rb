class ExpensesController < ApplicationController

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
    # show the total amount regarding each category of expenses
    expenses_by_group = @trip.expenses.group_by {|expense| expense.expense_category.name}

    total_expense_by_category = {}
    expenses_by_group.each do |key, value|
      total_expense_by_category[key] = value.sum { |e| e.amount }
    end

    @data = {
      labels: total_expense_by_category.keys,
      datasets: [
        {
            label: "Expense Category",
            backgroundColor: "rgba(220,220,220,0.2)",
            borderColor: "rgba(220,220,220,1)",
            data: total_expense_by_category.values,
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
