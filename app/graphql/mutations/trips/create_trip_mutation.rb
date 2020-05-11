# frozen_string_literal: true

module Mutations
  module Trips
    class CreateTripMutation < Mutations::BaseMutation
      type Types::TripType

      argument :name, String, required: true
      argument :description, String, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :finish_date, GraphQL::Types::ISO8601DateTime, required: false

      def resolve(**attributes)
        authorize Trip
        current_user.trips.create!(attributes)
      end
    end
  end
end
