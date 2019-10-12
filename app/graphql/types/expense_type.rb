# frozen_string_literal: true

module Types
  class ExpenseType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :description, String, null: true
    field :price, Integer, null: false
    field :price_currency, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :partakers, [PartakerType], null: false
    field :trip, TripType, null: false
  end
end
