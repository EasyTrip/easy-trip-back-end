# frozen_string_literal: true

module Queries
  class TripsQuery < BaseQuery
    type [Types::TripType], null: false
    description 'Returns a list of all trips'

    def resolve
      authorize Trip
      Trip.all
    end
  end
end
