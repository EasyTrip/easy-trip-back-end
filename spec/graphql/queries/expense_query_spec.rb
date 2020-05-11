# frozen_string_literal: true

describe Queries::ExpenseQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        expense(id: #{expense.id}) {
          id
          name
          description
          price
          priceCurrency
          partakers {
            id
          }
          trip {
            id
          }
        }
      }
    GQL
  end

  let!(:expense) { create(:expense) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(query, user) }

    context 'when user is authenticated and has access to expese' do
      let(:user) { expense.trip.creator }

      it 'returns correct expense' do
        request
        expect(json[:data][:expense]).to include(id: expense.id.to_s,
                                                 name: expense.name,
                                                 description: expense.description,
                                                 price: expense.price.to_s,
                                                 priceCurrency: expense.price_currency)
      end

      it 'returns correct trip' do
        request
        expect(json[:data][:expense][:trip][:id]).to eq expense.trip.id.to_s
      end

      it 'returns partakers' do
        request
        expect(json[:data][:expense][:partakers]).to be_a Array
      end
    end

    context 'when user does not have access to expense' do
      let(:user) { create(:expense).trip.creator }

      it 'returns errors' do
        request
        expect(json[:errors].first[:extensions][:code])
          .to eq EasyTripBackEndSchema::AUTHENTICATION_ERROR_CODE
      end
    end

    context 'when user is guest' do
      subject(:request) { gql_request(query) }

      it 'returns errors' do
        request
        expect(json[:errors].first[:extensions][:code])
          .to eq EasyTripBackEndSchema::AUTHENTICATION_ERROR_CODE
      end
    end
  end
end
