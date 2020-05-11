# frozen_string_literal: true

module Mutations
  module Trips
    class UpdateTripMutation < Mutations::BaseMutation
      type Types::TripType

      argument :id, ID, required: true
      argument :name, String, required: false
      argument :description, String, required: false
      argument :creator_id, ID, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :finish_date, GraphQL::Types::ISO8601DateTime, required: false

      def resolve(id:, **attributes)
        Trip.find(id).tap { |trip| authorize trip }.tap { |trip| trip.update!(attributes) }
      end
    end
  end
end
