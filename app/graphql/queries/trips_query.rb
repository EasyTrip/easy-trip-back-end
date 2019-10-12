# frozen_string_literal: true

module Queries
  class TripsQuery < BaseQuery
    type [Types::TripType], null: false
    description 'Returns a list of all trips'

    def resolve
      Trip.all
    end
  end
end
