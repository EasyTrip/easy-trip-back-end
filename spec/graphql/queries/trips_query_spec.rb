# frozen_string_literal: true

RSpec.describe Queries::TripsQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        trips {
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

      before { create(:trip) }

      it 'returns only users trip' do
        request
        expect(json[:data][:trips].size).to eq 1
      end

      it 'returns correct trips' do
        request
        expect(json[:data][:trips].first).to include(id: trip.id.to_s,
                                                     name: trip.name,
                                                     description: trip.description,
                                                     startDate: trip.start_date,
                                                     finishDate: trip.finish_date)
      end

      it 'returns correct creator' do
        request
        expect(json[:data][:trips].first[:creator][:id]).to eq user.id.to_s
      end
    end

    it_behaves_like 'when user is guest'
  end
end
