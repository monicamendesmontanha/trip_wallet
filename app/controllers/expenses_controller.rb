class ExpensesController < ApplicationController
  before_action :check_login!

  def index
    @expenses = Expense.all
  end


  # GET /expenses/new
  def add
    @trip = find_trip(params)
    return render_not_found if @trip == nil
    @expense = Expense.new
  end

  def history
    @trip = find_trip(params)
    return render_not_found if @trip == nil
  end

  def chart
    @trip = find_trip(params)
    return render_not_found if @trip == nil

    total_by_categories = @trip.expenses_by_category

    @data = {
      labels: total_by_categories.keys,
      datasets: [
        {
            label: "Expense Category",
            backgroundColor: "rgba(250,128,114,0.2)",
            borderColor: "rgba(250,128,114,1)",
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
        format.html { redirect_to add_expense_path(@expense.trip.id), flash: { errors: @expense.errors.full_messages } }
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


    def find_trip(params)
      Trip.find_by(user: current_user.id, id: params[:trip_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:amount, :notes, :expense_date, :expense_category_id, :trip_id)
    end
end
