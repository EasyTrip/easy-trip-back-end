# frozen_string_literal: true

describe Queries::UserQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        user(id: #{user_id}) {
          id
          firstName
          lastName
          signInCount
          currentSignInAt
          lastSignInAt
        }
      }
    GQL
  end

  describe '#resolve' do
    subject(:request) { valid_gql_request(query, user) }

    let(:user) { create(:user) }
    let(:user_id) { user.id }

    context 'when user is logged in' do
      it 'returns correct user' do
        request
        expect(json[:data][:user]).to include(id: user.id.to_s,
                                              firstName: user.first_name,
                                              lastName: user.last_name,
                                              signInCount: user.sign_in_count,
                                              currentSignInAt: user.current_sign_in_at,
                                              lastSignInAt: user.last_sign_in_at)
      end
    end

    context 'when record not found' do
      let(:user_id) { super() + 1 }

      it 'returns not found error' do
        request
        expect(json[:errors].first[:extensions][:code])
          .to eq EasyTripBackEndSchema::RECORD_NOT_FOUND_ERROR_CODE
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
