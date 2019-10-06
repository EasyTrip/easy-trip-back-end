# frozen_string_literal: true

class EasyTripBackEndSchema < GraphQL::Schema
  use GraphQL::Schema::Timeout, max_seconds: 5
  max_depth 20

  mutation(Types::MutationType)
  query(Types::QueryType)
end
