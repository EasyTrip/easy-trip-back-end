# frozen_string_literal: true

module Queries
  class TripsQuery < BaseQuery
    type [Types::ExpenseType], null: false
    description 'Returns a list of all expenses'

    def resolve
      Expense.all
    end
  end
end
