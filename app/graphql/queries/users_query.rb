# frozen_string_literal: true

module Queries
  class UsersQuery < BaseQuery
    type Types::UserType.connection_type, null: false
    description 'Returns a list of users in the easy trip'

    def resolve
      authorize User
      User.all
    end
  end
end
