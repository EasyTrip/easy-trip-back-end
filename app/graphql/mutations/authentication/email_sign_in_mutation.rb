# frozen_string_literal: true

module Mutations
  module Authentication
    class EmailSignInMutation < Mutations::BaseMutation
      argument :email, String, required: true
      argument :password, String, required: true

      field :auth_token, String, null: false
      field :user, Types::UserType, null: false

      def resolve(email:, password:)
        ::Authentication::EmailSignInService.call(email, password)
      end
    end
  end
end
