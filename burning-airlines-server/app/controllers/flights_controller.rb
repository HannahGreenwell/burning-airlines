class FlightsController < ApplicationController
  def new
    @flight = Flight.new
    @flights = Flight.all
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def search
    
  end

  private

  def flight_params
    params.require(:flight).permit(:flight_number, :date, :destination, :origin, :airplane_id)
  end
end
