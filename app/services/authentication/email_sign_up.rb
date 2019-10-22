# frozen_string_literal: true

module Authentication
  class EmailSignUp < BaseService
    def call
      # User will be saved inside EmailIdentity.create! method
      User.new(first_name: first_name, last_name: last_name).tap do |user|
        EmailIdentity.create!(email: email,
                              password: password,
                              password_confirmation: password_confirmation,
                              user: user)
      end
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
