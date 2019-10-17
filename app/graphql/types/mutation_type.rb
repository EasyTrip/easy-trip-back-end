# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
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
