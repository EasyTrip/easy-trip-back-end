# frozen_string_literal: true

module Authentication
  class SignIn < BaseService
    def call
      user = User.find_by!(email: email)
      raise AuthenticationError unless user.authenticate(password)

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
