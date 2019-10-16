# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :sign_in, mutation: Mutations::SignInMutation
    field :create_trip, mutation: Mutations::Trips::CreateTrip
    field :update_trip, mutation: Mutations::Trips::UpdateTrip
    field :destroy_trip, mutation: Mutations::Trips::DestroyTrip
  end
end
