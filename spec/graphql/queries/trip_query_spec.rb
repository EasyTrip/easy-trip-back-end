# frozen_string_literal: true

describe Queries::TripQuery, type: :request do
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
    subject(:request) { valid_gql_request(query, user) }

    context 'when user is authenticated and has access to trip' do
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

    context 'when user does not have access to trip' do
      let(:user) { create(:trip).creator }

      it 'returns errors' do
        request
        expect(json[:errors].first[:extensions][:code])
          .to eq EasyTripBackEndSchema::AUTHENTICATION_ERROR_CODE
      end
    end

    context 'when user is admin' do
      let(:user) { create(:trip).creator }

      before { user.add_role(:admin) }

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
        expect(json[:data][:trip][:creator][:id]).to eq trip.creator.id.to_s
      end
    end

    it_behaves_like 'when user is guest'
  end
end
