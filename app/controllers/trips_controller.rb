class TripsController < ApplicationController
  before_action :check_login!

  def index
    @trips = Trip.where(user: current_user.id)
  end

  def show
    #Find a current user and the trip regarding that user
    @trip = find_trip(params)
    return render_not_found if @trip == nil

    expenses_by_the_last_7_days = @trip.expenses_by_day

    @data = {
      labels: expenses_by_the_last_7_days.keys.map { |date| date.strftime("%a, %d %b") },
      datasets: [
        {
            label: "My Trip",
            backgroundColor: "rgba(250,128,114,0.2)",
            borderColor: "rgba(250,128,114,1)",
            data: expenses_by_the_last_7_days.values
        }
      ]
    }

  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
    @trip = find_trip(params)
    return render_not_found if @trip == nil
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /trips/1
  def update
    @trip = find_trip(params)
    return render_not_found if @trip == nil

    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /trips/1
  def destroy
    @trip = find_trip(params)
    return render_not_found if @trip == nil

    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
    end
  end

  private

    def find_trip(params)
      Trip.find_by(user: current_user.id, id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:name, :start_date, :end_date, :budget, :destination_id).merge({ user_id: current_user.id })
    end
end
