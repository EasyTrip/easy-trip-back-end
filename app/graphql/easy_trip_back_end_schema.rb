# frozen_string_literal: true

class EasyTripBackEndSchema < GraphQL::Schema
  default_max_page_size 50

  use GraphQL::Schema::Timeout, max_seconds: 5

  max_depth 20

  mutation(Types::MutationType)
  query(Types::QueryType)

  RECORD_NOT_FOUND_ERROR_CODE = 'RECORD_NOT_FOUND_ERROR'
  AUTHENTICATION_ERROR_CODE = 'AUTHENTICATION_ERROR'

  rescue_from(ActiveRecord::RecordNotFound) do |e|
    raise GraphQL::ExecutionError.new(e.message, extensions: { code: RECORD_NOT_FOUND_ERROR_CODE })
  end

  rescue_from(Pundit::NotAuthorizedError) do |e|
    raise GraphQL::ExecutionError.new(e.message, extensions: { code: AUTHENTICATION_ERROR_CODE })
  end
end
