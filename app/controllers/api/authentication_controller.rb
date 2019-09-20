# frozen_string_literal: true

module Api
  class AuthenticationController < ApplicationController
    skip_before_action :authenticate_request!

    def login
      render Authentication::Login.call params[:email], params[:password]
    end
  end
end
