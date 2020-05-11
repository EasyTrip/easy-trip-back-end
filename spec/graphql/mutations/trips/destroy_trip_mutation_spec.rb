# frozen_string_literal: true

describe Mutations::Trips::DestroyTripMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        destroyTrip(id: #{trip.id}) {
          id
          name
          description
          startDate
          finishDate
        }
      }
    GQL
  end

  let(:user) { trip.creator }
  let!(:trip) { create(:trip) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    context 'when user is authenticated' do
      it 'removes trip' do
        expect { request }.to change(Trip, :count).by(-1)
      end

      it 'returns correct trip' do
        request
        expect(json[:data][:destroyTrip]).to include(id: trip.id.to_s,
                                                     name: trip.name,
                                                     description: trip.description,
                                                     startDate: trip.start_date,
                                                     finishDate: trip.finish_date)
      end
    end

    context 'when user is guest' do
      subject(:request) { gql_request(mutation) }

      it 'does not remove trip' do
        expect { request }.not_to change(Trip, :count)
      end

      include_examples 'when user is guest' do
        let(:query) { mutation }
      end
    end
  end
end
