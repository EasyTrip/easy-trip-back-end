# frozen_string_literal: true

describe Queries::ExpensesQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        expenses {
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

    context 'when user is authenticated and has access to expenses' do
      let(:user) { expense.trip.creator }

      it 'returns correct expenses' do
        request
        expect(json[:data][:expenses].first).to include(id: expense.id.to_s,
                                                        name: expense.name,
                                                        description: expense.description,
                                                        price: expense.price.to_s,
                                                        priceCurrency: expense.price_currency)
      end

      it 'returns correct trip' do
        request
        expect(json[:data][:expenses].first[:trip][:id]).to eq expense.trip.id.to_s
      end

      it 'returns partakers' do
        request
        expect(json[:data][:expenses].first[:partakers]).to be_a Array
      end
    end

    context 'when user does not have any expenses' do
      let(:user) { create(:user) }

      it 'returns zero expenses' do
        request
        expect(json[:data][:expenses]).to be_empty
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
