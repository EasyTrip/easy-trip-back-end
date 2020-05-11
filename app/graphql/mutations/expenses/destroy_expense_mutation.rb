# frozen_string_literal: true

module Mutations
  module Expenses
    class DestroyExpenseMutation < Mutations::BaseMutation
      type Types::ExpenseType

      argument :id, ID, required: true

      def resolve(id:)
        Expense.find(id).tap { |expense| authorize expense }.destroy!
      end
    end
  end
end
