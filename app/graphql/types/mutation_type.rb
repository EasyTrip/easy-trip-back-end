# frozen_string_literal: true

module Types
  class MutationType < Types::Base::Object
    # auth
    field :email_sign_up, mutation: Mutations::Authentication::EmailSignUpMutation
    field :email_sign_in, mutation: Mutations::Authentication::EmailSignInMutation
    # trips
    field :create_trip, mutation: Mutations::Trips::CreateTrip
    field :update_trip, mutation: Mutations::Trips::UpdateTrip
    field :destroy_trip, mutation: Mutations::Trips::DestroyTrip
    # expenses
    field :create_expense, mutation: Mutations::Expenses::CreateExpense
    field :update_expense, mutation: Mutations::Expenses::UpdateExpense
    field :destroy_expense, mutation: Mutations::Expenses::DestroyExpense
  end
end
