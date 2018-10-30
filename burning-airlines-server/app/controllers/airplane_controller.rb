class AirplaneController < ApplicationController

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.save
    redirect_to new_airplane_path

  end

  def index
  end

  def show
  end


  private
  def airplane_params
    params.require(:airplane).permit(:rows, :columns, :model)
  end

end
