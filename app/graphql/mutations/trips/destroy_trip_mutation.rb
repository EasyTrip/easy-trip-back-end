# frozen_string_literal: true

module Mutations
  module Trips
    class DestroyTripMutation < Mutations::BaseMutation
      type Types::TripType

      argument :id, ID, required: true

      def resolve(id:)
        authorize Trip
        Trip.find(id).destroy!
      end
    end
  end
end
