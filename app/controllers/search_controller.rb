class SearchController < ApplicationController
  def vehicle_by_plate
    vehicle = Vehicle.find_by(plate: vehicle_by_plate_params[:plate])

    if vehicle
      render json: vehicle, status: :ok
    else
      render json: { error: 'Vehicle not found' }, status: :not_found
    end
  end

  private

  def vehicle_by_plate_params
    params.require(:search).permit(:plate)
  end
end
