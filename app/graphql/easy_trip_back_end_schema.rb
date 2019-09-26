# frozen_string_literal: true

class EasyTripBackEndSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
