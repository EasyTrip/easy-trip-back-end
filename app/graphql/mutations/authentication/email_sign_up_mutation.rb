# frozen_string_literal: true

module Mutations
  module Authentication
    class EmailSignUpMutation < Mutations::BaseMutation
      type Types::UserType

      argument :email, String, required: true
      argument :first_name, String, required: true
      argument :last_name, String, required: true
      argument :password, String, required: true
      argument :password_confirmation, String, required: true

      def resolve(**attributes)
        ::Authentication::EmailSignUpService.call(**attributes)
      end
    end
  end
end
