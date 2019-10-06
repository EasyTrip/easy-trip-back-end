# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def current_user
    @current_user = Authentication::CurrentUser.call request.headers['Authorization']
  rescue AuthenticationError => e
    render json: { errors: [e.message] }, status: :unauthorized
  end
end
