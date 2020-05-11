# frozen_string_literal: true

module Authentication
  class CurrentUserService < BaseService
    def call
      return User.find(payload[:user_id]) if user_id_in_token?

      raise AuthenticationError, 'Not Authenticated'
    rescue JWT::ExpiredSignature
      raise AuthenticationError, 'Auth token has expired'
    rescue JWT::VerificationError, JWT::DecodeError
      raise AuthenticationError, 'JWT Token is Broken'
    end

    private

    attr_reader :auth_token

    def initialize(auth_token)
      @auth_token = auth_token
    end

    def http_token
      @http_token ||= auth_token&.split(' ')&.last
    end

    def payload
      @payload ||= JsonWebToken.decode(http_token)
    end

    def user_id_in_token?
      http_token && payload && payload[:user_id]
    end
  end
end
