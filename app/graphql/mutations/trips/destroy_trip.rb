# frozen_string_literal: true

module Mutations
  module Trips
    class DestroyTrip < Mutations::BaseMutation
      type Types::TripType

      argument :id, ID, required: true

      def resolve(id:)
        Trip.find(id).destroy!
      end
    end
  end
end
