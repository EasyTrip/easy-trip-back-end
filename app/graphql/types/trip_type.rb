# frozen_string_literal: true

module Types
  class TripType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :creator, UserType, null: false
    field :start_date, GraphQL::Types::ISO8601DateTime, null: true
    field :finish_date, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
