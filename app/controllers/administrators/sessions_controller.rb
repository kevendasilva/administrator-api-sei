# frozen_string_literal: true

class Administrators::SessionsController < Devise::SessionsController
  respond_to :json
end
