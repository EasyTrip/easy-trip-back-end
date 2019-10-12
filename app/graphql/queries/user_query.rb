# frozen_string_literal: true

module Queries
  class UserQuery < BaseQuery
    type Types::UserType, null: false
    description 'Returns a single User by id'

    argument :id, ID, required: true

    def resolve(id:)
      User.find(id)
    end
  end
end
