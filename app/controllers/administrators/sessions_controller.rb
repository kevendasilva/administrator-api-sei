# frozen_string_literal: true

class Administrators::SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    yield resource if block_given?

    render json: {
      message: 'Logged in successfully.'
    }, status: :ok
  end

  private

  def respond_to_on_destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    yield if block_given?

    render json: {
      message: "Logged out successfully."
    }, status: :ok
  end
end
