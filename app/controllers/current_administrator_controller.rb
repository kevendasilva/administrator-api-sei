class CurrentAdministratorController < ApplicationController
  before_action :authenticate_administrator!
  
  def index
    render json: current_administrator, status: :ok
  end
end
