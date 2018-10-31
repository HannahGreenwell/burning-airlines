class ReservationsController < ApplicationController

  #So that this can be accessed from an external location
  skip_before_action :verify_authenticity_token

  def index
    render json: Reservation.all.reverse
  end

  def show
    reservation = Reservation.find(params[:id])
    render json: {reservation: reservation, user: reservation.user, flight: reservation.flight, airplane: reservation.flight.airplane}
  end

  def create
    reservation = Reservation.create(
      seatRow: params[:seatRow],
      seatColumn: params[:seatColumn],
      user_id: params[:user_id],
      flight_id: params[:flight_id],
    )
    redirect_to reservation_booked_path(reservation);
  end
end
