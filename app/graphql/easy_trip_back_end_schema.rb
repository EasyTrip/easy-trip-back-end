# frozen_string_literal: true

class EasyTripBackEndSchema < GraphQL::Schema
  use GraphQL::Schema::Timeout, max_seconds: 5
  max_depth 20

  mutation(Types::MutationType)
  query(Types::QueryType)

  AUTHENTICATION_ERROR_CODE = 'AUTHENTICATION_ERROR'

  rescue_from(Pundit::NotAuthorizedError) do |e|
    raise GraphQL::ExecutionError.new(e.message, extensions: { code: AUTHENTICATION_ERROR_CODE })
  end
end
