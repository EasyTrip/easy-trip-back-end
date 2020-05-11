# frozen_string_literal: true

module Mutations
  module Expenses
    class UpdateExpenseMutation < Mutations::BaseMutation
      type Types::ExpenseType

      argument :id, ID, required: true
      argument :trip_id, ID, required: false
      argument :name, String, required: false
      argument :description, String, required: false
      argument :price, Float, required: false
      argument :price_currency, String, required: false

      def resolve(id:, **attributes)
        Expense.find(id)
               .tap { |expense| authorize expense }
               .tap { |expense| expense.update!(attributes) }
      end
    end
  end
end
