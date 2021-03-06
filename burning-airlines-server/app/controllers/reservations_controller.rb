class ReservationsController < ApplicationController

  #So that this can be accessed from an external location
  skip_before_action :verify_authenticity_token

  def index
    render json: Reservation.all.reverse
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: {:reservation => {:id => reservation.id, :seatRow => reservation.seatRow, :seatColumn => reservation.seatColumn}, :user => {:name => reservation.user.name, :email => reservation.user.email}, :flight => {:flight_number => reservation.flight.flight_number, :date => reservation.flight.date, :destination => reservation.flight.destination, :origin => reservation.flight.origin}, :airplane => {:rows => reservation.flight.airplane.rows, :columns => reservation.flight.airplane.columns, :model => reservation.flight.airplane.model}}
  end

  def create
    reservation = Reservation.create(
      seatRow: params[:seatRow],
      seatColumn: params[:seatColumn],
      user_id: User.find_by(email: params[:email]).id,
      flight_id: params[:flight_id],
    )

    render json: reservation
  end
end
