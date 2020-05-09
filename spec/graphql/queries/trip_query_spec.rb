# frozen_string_literal: true

RSpec.describe Queries::TripQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        trip(id: #{trip.id}) {
          id
          name
          description
          startDate
          finishDate
          creator {
            id
          }
        }
      }
    GQL
  end

  let(:trip) { create(:trip) }

  describe '#resolve' do
    context 'when user is authenticated' do
      subject(:request) { valid_gql_request(query, user) }

      let(:user) { trip.creator }

      it 'returns correct trip' do
        request
        expect(json[:data][:trip]).to include(id: trip.id.to_s,
                                              name: trip.name,
                                              description: trip.description,
                                              startDate: trip.start_date,
                                              finishDate: trip.finish_date)
      end

      it 'returns correct creator' do
        request
        expect(json[:data][:trip][:creator][:id]).to eq user.id.to_s
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
