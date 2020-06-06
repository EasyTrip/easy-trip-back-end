# frozen_string_literal: true

describe Queries::UsersQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        users {
          nodes {
            id
            firstName
            lastName
            signInCount
            currentSignInAt
            lastSignInAt
          }
        }
      }
    GQL
  end

  describe '#resolve' do
    subject(:request) { valid_gql_request(query, user) }

    let(:user) { create(:user) }

    context 'when user is logged in' do
      it 'returns correct users' do
        request
        expect(json[:data][:users][:nodes].first).to include(id: user.id.to_s,
                                                             firstName: user.first_name,
                                                             lastName: user.last_name,
                                                             signInCount: user.sign_in_count,
                                                             currentSignInAt: user.current_sign_in_at,
                                                             lastSignInAt: user.last_sign_in_at)
      end

      it 'returns 1 user' do
        request
        expect(json[:data][:users][:nodes].count).to eq 1
      end
    end

    it_behaves_like 'when user is guest'
  end
end
