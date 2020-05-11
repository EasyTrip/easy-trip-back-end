# frozen_string_literal: true

describe Mutations::Expenses::CreateExpenseMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        createExpense(tripId: #{trip.id}
                      name: "#{name}",
                      description: "#{description}",
                      price: #{price},
                      priceCurrency: "#{price_currency}") {
          id
          name
          description
          price
          priceCurrency
        }
      }
    GQL
  end

  let(:user) { trip.creator }
  let!(:trip) { create(:trip) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    let(:name) { Faker::Food.dish }
    let(:description) { Faker::Food.description }
    let(:price) { Faker::Number.decimal(l_digits: 2) }
    let(:price_currency) { 'USD' }

    context 'when user is authenticated' do
      it 'creates a expense' do
        expect { request }.to change(Expense, :count).by 1
      end

      it 'returns a trip' do
        request
        expect(json[:data][:createExpense]).to include(id: kind_of(String),
                                                    name: name,
                                                    description: description,
                                                    price: price.to_s,
                                                    priceCurrency: price_currency)
      end
    end

    it_behaves_like 'when user is guest' do
      let(:query) { mutation }
    end
  end
end
