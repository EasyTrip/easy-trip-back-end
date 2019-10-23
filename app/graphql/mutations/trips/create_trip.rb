# frozen_string_literal: true

module Mutations
  module Trips
    class CreateTrip < Mutations::BaseMutation
      type Types::TripType

      argument :name, String, required: true
      argument :description, String, required: false
      argument :creator_id, ID, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :finish_date, GraphQL::Types::ISO8601DateTime, required: false

      def resolve(creator_id: nil, **attributes)
        authorize Trip
        user = creator_id ? User.find(creator_id) : current_user
        user.trips.create!(attributes)
      end
    end
  end
end
