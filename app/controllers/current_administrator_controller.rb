class CurrentAdministratorController < ApplicationController  
  def index
    render json: current_administrator, status: :ok
  end
end
