# frozen_string_literal: true

module Queries
  class ExpenseQuery < BaseQuery
    type Types::ExpenseType, null: false
    description 'Returns a single Expense by id'

    argument :id, ID, required: true

    def resolve(id:)
      authorize Expense
      Expense.find(id)
    end
  end
end