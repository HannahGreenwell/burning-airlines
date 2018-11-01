class FlightsController < ApplicationController

  #So that this can be accessed from an external location
  skip_before_action :verify_authenticity_token

  def new
    @flight = Flight.new
    @flights = Flight.all
  end

  def create
    Flight.create flight_params
    redirect_to flights_path
  end

  def show
    #This method returns the requisite JSON for a flight show page
    flight = Flight.find(params[:id])
    #This returns the information about the flight matching the id given
    render json: {:flight => {:id => flight.id, :flight_number => flight.flight_number, :destination => flight.destination, :origin => flight.origin, :date => flight.date}, :airplane => {:id => flight.airplane.id, :rows => flight.airplane.rows, :columns => flight.airplane.columns, :model => flight.airplane.model}, :reservations => flight.reservations}
    # render json: flight.as_json(only: [:id, :flight_number, :date, :origin, :destination], :include => [:reservations, :airplane])
  end

  def search
    #This method executes a search and returns correct JSON response

    @from = params[:from]
    @to = params[:to]

    #flights = Flight.where(origin: @from, destination: @to)
    flights = Flight.where('origin ILIKE ? AND destination ILIKE ?', '%' + @from + '%', '%' + @to + '%')

    #This returns the information about the flights matching the search
    #Also the airplane being used
    render json: {:flights => flights.as_json(:include => [:airplane, :reservations])}
    #render json: flights: {flights, include: [:airplane, :reservations]}
  end

  def find_page
    #This doesn't need to do anything as a user hasn't searched yet
  end

  def index
    @flights = Flight.all
  end

  private

  def flight_params
    params.require(:flight).permit(:flight_number, :date, :destination, :origin, :airplane_id)
  end
end
