class VehiclesController < ApplicationController
  def index
    @vehicles = Vehicle.all.order(created_at: :asc)
  end

  def new # New é do front
    @vehicle = Vehicle.new
  end

  def create # Create é do back
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new # Chama o new da instância atual sem perder os dados já digitados.
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end
  
  def edit
    @vehicle = Vehicle.find(params[:id])
  end

  def update
    @vehicle = Vehicle.find(params[:id])

    if @vehicle.update(vehicle_params)
      redirect_to vehicle_path(@vehicle)
    else
      render :edit # Chama o new da instância atual sem perder os dados já digitados.
    end
  end

  def destroy
    @vehicle = Vehicle.find(params[:id])
    @vehicle.destroy
    redirect_to vehicle_path
  end

  private 

  def vehicle_params
    params.require(:vehicle).permit(:brand, :model, :year, :kind)
  end
end