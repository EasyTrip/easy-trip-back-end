# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include PunditHelpers
    include SchemaHelpers
  end
end
