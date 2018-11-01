class UsersController < ApplicationController

  #So that this can be accessed from an external location
  skip_before_action :verify_authenticity_token

  def show
    user = User.find_by(email: params[:email])
    reservations = user.reservations
    render json: user, include: {reservations: { include: {flight: {include: :airplane}}}}, :except => [:created_at, :updated_at, :password_digest]
  end

  def results
  end
end
