# frozen_string_literal: true

module Types
  class PartakerType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :payment_price, Integer, null: true
    field :payment_currency, String, null: true
    field :expense, ExpenseType, null: false

    def payment_price
      object.payment&.price
    end

    def payment_currency
      object.payment.price_currency
    end
  end
end
