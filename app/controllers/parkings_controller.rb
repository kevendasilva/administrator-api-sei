class ParkingsController < ApplicationController
  before_action :set_parking, only: %i[ show update destroy ]
  before_action :authenticate_administrator!

  # GET /parkings
  def index
    @parkings = current_administrator.parkings

    render json: @parkings
  end

  # GET /parkings/1
  def show

    if @parking
      render json: @parking
    else
      render json: {
        message: "Error when trying to show parking."
      }, status: :not_found
    end
  end

  # POST /parkings
  def create
    @parking = current_administrator.parkings.build(parking_params)

    if @parking.save
      render json: @parking, status: :created, location: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parkings/1
  def update
    if @parking.update(parking_params)
      render json: @parking
    else
      render json: @parking.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parkings/1
  def destroy
    if @parking.destroy
      render json: {
        message: "Successfully deleted."
      }, status: :ok
    else
      render json: {
        message: "Error deleting vacancy."
      }, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      if current_administrator
        @parking = current_administrator.parkings.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def parking_params
      params.require(:parking).permit(:name, :address, :opening_time, :closing_time, :cost_per_hour)
    end
end
