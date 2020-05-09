# frozen_string_literal: true

module Types
  class ArtificialUserType < Types::Base::Object
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :creator, UserType, null: false
  end
end
