# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit

  private

  def current_user
    @current_user ||= Authentication::CurrentUserService.call(request.headers['Authorization'])
  rescue AuthenticationError
    @current_user ||= Guest.new
  end
end
