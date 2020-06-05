# frozen_string_literal: true

describe Mutations::TripMemberships::CreateTripMembershipMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        createTripMembership(tripId: #{trip.id}
                             memberId: #{member.id},
                             memberType: #{member_type}) {
          id
          trip {
            id
          }
          member {
            ... on User {
              id
              firstName
              lastName
            }
            ... on ArtificialUser {
              id
              firstName
              lastName
            }
          }
          memberType
        }
      }
    GQL
  end

  let(:user) { trip.creator }
  let!(:trip) { create(:trip) }
  let(:member_type) { member.class.name }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    shared_examples 'creates trip_membership' do
      it 'creates trip_membership' do
        expect { request }.to change(TripMembership, :count).by 1
      end

      it 'returns trip_membership' do
        request
        expect(json[:data][:createTripMembership]).to include(id: kind_of(String),
                                                              trip: { id: trip.id.to_s },
                                                              member: { id: member.id.to_s,
                                                                        firstName: member.first_name,
                                                                        lastName: member.last_name },
                                                              memberType: member_type)
      end
    end

    context 'when user is authenticated' do
      context 'when member is User' do
        let(:member) { create(:user) }

        include_examples 'creates trip_membership'
      end

      context 'when member is ArtificialUser' do
        let(:member) { create(:artificial_user, creator: user) }

        include_examples 'creates trip_membership'
      end
    end

    it_behaves_like 'when user is guest' do
      let(:query) { mutation }
      let(:member) { create(:user) }
    end
  end
end
