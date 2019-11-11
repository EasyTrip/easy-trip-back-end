# frozen_string_literal: true

module Authentication
  class EmailSignIn < BaseService
    def call
      email_identity = EmailIdentity.find_by!(email: email)
      raise AuthenticationError unless email_identity.authenticate(password)

      user = email_identity.user
      user.sign_in
      { token: token(user),
        user: user }
    end

    private

    attr_reader :email, :password

    def initialize(email, password)
      @email = email
      @password = password
    end

    EXPIRATION_DAYS = 7

    def token(user)
      exp = EXPIRATION_DAYS.days.from_now.to_i
      JsonWebToken.encode(user_id: user.id, exp: exp)
    end
  end
end