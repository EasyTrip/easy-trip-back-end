# frozen_string_literal: true

describe Mutations::Trips::UpdateTripMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        updateTrip(id: #{trip.id}, name: "#{new_name}", description: "#{new_description}") {
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

    let(:new_name) { "#{trip.name}-2" }
    let(:new_description) { "#{trip.description}-2" }

    context 'when user is authenticated' do
      it 'changes name' do
        expect { request }.to change { trip.reload.name }.from(trip.name).to(new_name)
      end

      it 'changes description' do
        expect { request }
          .to change { trip.reload.description }.from(trip.description).to(new_description)
      end

      it 'returns changed trip' do
        request
        expect(json[:data][:updateTrip]).to include(id: trip.id.to_s,
                                                    name: new_name,
                                                    description: new_description,
                                                    startDate: trip.start_date,
                                                    finishDate: trip.finish_date)
      end
    end

    context 'when user is guest' do
      subject(:request) { gql_request(mutation) }

      it 'does not change trip' do
        expect { request }.not_to change(trip, :reload)
      end

      include_examples 'when user is guest' do
        let(:query) { mutation }
      end
    end
  end
end
