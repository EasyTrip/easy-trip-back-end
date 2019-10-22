# frozen_string_literal: true

module Authentication
  class EmailSignUp < BaseService
    def call
      User.create!(user_params)
    end

    private

    attr_reader :user_params

    def initialize(user_params)
      @user_params = user_params
    end
  end
end
