# frozen_string_literal: true

module Trips
  class CreateService < BaseService
    def call
      user.trips.create!(attributes).tap do |trip|
        trip.trip_memberships.create!(member: user)
      end
    end

    private

    attr_reader :user, :attributes

    def initialize(user, attributes)
      @user = user
      @attributes = attributes
    end
  end
end
