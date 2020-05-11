# frozen_string_literal: true

module Authentication
  class EmailSignUpService < BaseService
    def call
      User.create!(first_name: first_name,
                   last_name: last_name,
                   email_identity_attributes: { email: email,
                                                password: password,
                                                password_confirmation: password_confirmation })
    end

    private

    attr_reader :email, :first_name, :last_name, :password, :password_confirmation

    def initialize(email:, first_name:, last_name:, password:, password_confirmation:)
      @email = email
      @first_name = first_name
      @last_name = last_name
      @password = password
      @password_confirmation = password_confirmation
    end
  end
end
