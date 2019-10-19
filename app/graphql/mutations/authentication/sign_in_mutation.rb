# frozen_string_literal: true

module Mutations
  module Authentication
    class SignInMutation < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :token, String, null: false
      field :user, Types::UserType, null: false

      def resolve(email:, password:)
        ::Authentication::SignIn.call(email, password)
      end
    end
  end
end
