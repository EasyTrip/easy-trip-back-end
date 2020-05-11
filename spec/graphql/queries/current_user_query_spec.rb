# frozen_string_literal: true

RSpec.describe Queries::CurrentUserQuery, type: :request do
  let(:query) do
    <<~GQL
      query {
        currentUser {
          id,
          email,
          firstName,
          lastName,
          signInCount,
          currentSignInAt,
          lastSignInAt,
          createdAt,
          updatedAt,
          trips {
            id
          }
        }
      }
    GQL
  end

  describe '#resolve' do
    context 'when user is authenticated' do
      subject(:request) { valid_gql_request(query, user) }

      let(:user) { create(:user) }

      it 'returns correct user' do
        request
        expect(json[:data][:currentUser]).to include(id: user.id.to_s,
                                                     email: user.email,
                                                     firstName: user.first_name,
                                                     lastName: user.last_name,
                                                     signInCount: user.sign_in_count,
                                                     lastSignInAt: user.last_sign_in_at)
      end

      it 'returns trips' do
        request
        expect(json[:data][:currentUser][:trips]).to be_a(Array)
      end
    end

    it_behaves_like 'when user is guest'
  end
end
