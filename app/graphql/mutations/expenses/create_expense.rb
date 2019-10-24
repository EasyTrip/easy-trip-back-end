# frozen_string_literal: true

module Mutations
  module Expenses
    class CreateExpense < Mutations::BaseMutation
      type Types::ExpenseType

      argument :trip_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
      argument :price, Float, required: true
      argument :currency, String, required: false

      def resolve(trip_id:, **attributes)
        authorize Expense
        Trip.find(trip_id).expenses.create!(attributes)
      end
    end
  end
end
