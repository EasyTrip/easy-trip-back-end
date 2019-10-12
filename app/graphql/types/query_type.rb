# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # users
    field :current_user, resolver: Queries::CurrentUserQuery
    field :users, resolver: Queries::UsersQuery
    field :user, resolver: Queries::UserQuery
    # trips
    field :trips, resolver: Queries::TripsQuery
    field :trip, resolver: Queries::TripQuery
    # expenses
    field :espenses, resolver: Queries::ExpenseQuery
    field :expense, resolver: Queries::ExpenseQuery
  end
end
