class MovementsController < ApplicationController
  before_action :set_movement, only: %i[ show update destroy ]
  before_action :authenticate_administrator!

  # GET /movements
  def index
    @movements = Movement.where(parking_id: params[:parking_id])

    render json: @movements
  end

  # GET /movements/1
  def show
    render json: @movement
  end

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
    @movement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movement_params
      params.require(:movement).permit(:cost, :vehicle_id, :client_id)
    end
end
