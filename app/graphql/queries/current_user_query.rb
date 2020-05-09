# frozen_string_literal: true

module Queries
  class CurrentUserQuery < BaseQuery
    type Types::UserType, null: false
    description 'Returns a user based on auth token'

    def resolve
      current_user
    end
  end
end
