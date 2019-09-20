# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request!

  private

  attr_reader :current_user

  def authenticate_request!
    @current_user = Authentication::CurrentUser.call request.headers['Authorization']
  rescue Authentication::AuthenticationError => e
    render json: { errors: [e.message] }, status: :unauthorized
  end
end
