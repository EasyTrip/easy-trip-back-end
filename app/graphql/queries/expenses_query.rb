# frozen_string_literal: true

module Queries
  class ExpensesQuery < BaseQuery
    type [Types::ExpenseType], null: false
    description 'Returns a list of all expenses'

    def resolve
      authorize Expense
      Expense.joins(:trip).where(trips: { creator: current_user })
    end
  end
end
