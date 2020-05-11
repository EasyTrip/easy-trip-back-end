# frozen_string_literal: true

module Mutations
  module Expenses
    class CreateExpenseMutation < Mutations::BaseMutation
      type Types::ExpenseType

      argument :trip_id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
      argument :price, Float, required: true
      argument :price_currency, String, required: false

      def resolve(trip_id:, **attributes)
        authorize Expense
        Trip.find(trip_id).tap { |trip| authorize trip, :update? }.expenses.create!(attributes)
      end
    end
  end
end
