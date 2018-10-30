class AirplanesController < ApplicationController

    def new
      @airplane = Airplane.new
    end

    def create
      @airplane = Airplane.new(airplane_params)
      @airplane.save
      redirect_to airplanes_path

    end

    def index
      @airplanes = Airplane.all
    end

    def show
      @airplane = Airplane.find(params[:id])
    end


    private
    def airplane_params
      params.require(:airplane).permit(:rows, :columns, :model)
    end

  end
