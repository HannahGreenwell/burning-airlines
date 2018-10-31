class FlightsController < ApplicationController

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
    render json: flight.as_json(only: [:id, :flight_number, :date, :origin, :destination], :include => [:reservations, :airplane])
  end

  def search
    #This method executes a search and returns correct JSON response
    @from = params[:from]
    @to = params[:to]

    #This loops through matching flights to return
    #flights = Flight.where(origin: @from, destination: @to)
    flights = Flight.where('origin ILIKE ? AND destination ILIKE ?', '%' + @from + '%', '%' + @to + '%')
    flights.each do |flight|
      airplane = flight.airplane
      puts "Flight number: #{flight.flight_number}"
      puts "Flight date: #{flight.date}"
      puts "Flight origin: #{flight.origin}"
      puts "Flight destination: #{flight.destination}"
      puts "Airplane model: #{airplane.model}"
    end

    #This returns the information about the flights matching the search
    #Also the airplane being used
    render json: flights.as_json(only: [:id, :flight_id, :seatRow, :seatColumn], :include => [:airplane])
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
