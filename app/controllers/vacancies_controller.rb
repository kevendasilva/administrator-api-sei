class VacanciesController < ApplicationController
  before_action :set_vacancy, only: %i[ show update destroy ]

  # GET /vacancies
  def index
    @parking_id = params[:parking_id]
    @vacancies = Vacancy.where(parking_id: @parking_id)

    if @parking_id
      render json: @vacancies
    else
      render json: {
        message: "Parking ID must be provided."
      }, status: :bad_request
    end
  end

  # POST /vacancies
  def create
    @vacancy = Vacancy.new(vacancy_params)

    if @vacancy.save
      render json: @vacancy, status: :created
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vacancies/1
  def update
    if @vacancy.update(vacancy_params)
      render json: @vacancy
    else
      render json: @vacancy.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vacancies/1
  def destroy
    if @vacancy.destroy
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
    def set_vacancy
      @vacancy = Vacancy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacancy_params
      params.require(:vacancy).permit(:code, :kind, :parking_id)
    end
end
