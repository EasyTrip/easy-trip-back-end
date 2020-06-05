# frozen_string_literal: true

module Types
  class TripMembershipType < Types::Base::Object
    field :id, ID, null: false
    field :trip, TripType, null: false
    field :member, MemberUnionType, null: false
    field :member_type, ::Types::MemberTypeEnumType, null: false

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
