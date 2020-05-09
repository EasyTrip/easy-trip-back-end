# frozen_string_literal: true

module Types
  class QueryType < Types::Base::Object
    # users
    field :current_user, resolver: Queries::CurrentUserQuery
    field :users, resolver: Queries::UsersQuery
    field :user, resolver: Queries::UserQuery
    # trips
    field :trips, resolver: Queries::TripsQuery
    field :trip, resolver: Queries::TripQuery
    # expenses
    field :expenses, resolver: Queries::ExpensesQuery
    field :expense, resolver: Queries::ExpenseQuery
  end
end
