class ReservationsController < ApplicationController

  #So that this can be accessed from an external location
  skip_before_action :verify_authenticity_token

  def index
    render json: Reservation.all.reverse
  end

  def create
    # TODO - this should look something like this 
    # reservation = Reservation.create(
    #   seatRow: params[:seatRow],
    #   seatColumn: params[:seatColumn],
    #   user_id: params[:user_id],
    #   flight_id: params[:flight_id],
    # )
    # render json: {reservation: reservation, created: true}
  end
end
