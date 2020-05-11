# frozen_string_literal: true

describe Mutations::Expenses::DestroyExpenseMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        destroyExpense(id: #{expense.id}) {
          id
          name
          description
          price
          priceCurrency
        }
      }
    GQL
  end

  let(:user) { expense.trip.creator }
  let!(:expense) { create(:expense) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    context 'when user is authenticated' do
      it 'removes expense' do
        expect { request }.to change(Expense, :count).by(-1)
      end

      it 'returns correct expense' do
        request
        expect(json[:data][:destroyExpense]).to include(id: expense.id.to_s,
                                                        name: expense.name,
                                                        description: expense.description,
                                                        price: expense.price.to_s,
                                                        priceCurrency: expense.price_currency)
      end
    end

    context 'when user is guest' do
      subject(:request) { gql_request(mutation) }

      it 'does not remove expense' do
        expect { request }.not_to change(Expense, :count)
      end

      include_examples 'when user is guest' do
        let(:query) { mutation }
      end
    end
  end
end
