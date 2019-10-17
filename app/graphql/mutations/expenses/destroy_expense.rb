# frozen_string_literal: true

module Mutations
  module Expenses
    class DestroyExpense < Mutations::BaseMutation
      type Types::ExpenseType

      argument :id, ID, required: true

      def resolve(id:)
        Expense.find(id).destroy!
      end
    end
  end
end
