# frozen_string_literal: true

module Queries
  class TripQuery < BaseQuery
    type Types::TripType, null: false
    description 'Returns a single Trip by id'

    argument :id, ID, required: true

    def resolve(id:)
      Trip.find(id).tap { |trip| authorize(trip) }
    end
  end
end
