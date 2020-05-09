# frozen_string_literal: true

module Types
  class PartakerType < Types::Base::Object
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :payment_price, String, null: true
    field :payment_price_currency, String, null: true
    field :expense, ExpenseType, null: false
    field :member, MemberUnionType, null: false
  end
end
