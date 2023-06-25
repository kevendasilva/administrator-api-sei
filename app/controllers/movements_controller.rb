class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ update destroy ]
  before_action :authenticate_administrator!

  # POST /movements
  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      render json: @movement, status: :created, location: @movement
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movements/1
  def update
    if @movement.update(movement_params)
      render json: @movement
    else
      render json: @movement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movements/1
  def destroy
    if @movement.destroy
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
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.require(:movement).permit(:cost, :entry, :exit, :vehicle_id, :client_id)
    end
end
