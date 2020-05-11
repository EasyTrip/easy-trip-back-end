# frozen_string_literal: true

module Types
  class MutationType < GraphQL::Schema::Object
    # auth
    field :email_sign_up, mutation: Mutations::Authentication::EmailSignUpMutation
    field :email_sign_in, mutation: Mutations::Authentication::EmailSignInMutation
    # trips
    field :create_trip, mutation: Mutations::Trips::CreateTripMutation
    field :update_trip, mutation: Mutations::Trips::UpdateTripMutation
    field :destroy_trip, mutation: Mutations::Trips::DestroyTripMutation
    # expenses
    field :create_expense, mutation: Mutations::Expenses::CreateExpenseMutation
    field :update_expense, mutation: Mutations::Expenses::UpdateExpenseMutation
    field :destroy_expense, mutation: Mutations::Expenses::DestroyExpenseMutation
  end
end
