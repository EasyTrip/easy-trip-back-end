# frozen_string_literal: true

module Authentication
  class EmailSignInService < BaseService
    EXPIRATION_DAYS = 7

    def call
      email_identity = EmailIdentity.find_by!(email: email)
      raise AuthenticationError unless email_identity.authenticate(password)

      user = email_identity.user
      user.sign_in!
      { auth_token: auth_token(user),
        user: user }
    end

    private

    attr_reader :email, :password

    def initialize(email, password)
      @email = email
      @password = password
    end

    def auth_token(user)
      exp = EXPIRATION_DAYS.days.from_now.to_i
      JsonWebToken.encode(user_id: user.id, exp: exp)
    end
  end
end
