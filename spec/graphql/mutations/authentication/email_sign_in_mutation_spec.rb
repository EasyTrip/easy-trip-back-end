# frozen_string_literal: true

describe Mutations::Authentication::EmailSignInMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        emailSignIn(email: "#{email}", password: "#{password}") {
          authToken
          user {
            id
          }
        }
      }
    GQL
  end

  let!(:user) { create(:user, email_identity_attributes: { email: email, password: password }) }
  let(:email) { Faker::Internet.email }
  let(:password) { Faker::Internet.password }

  describe '#resolve' do
    subject(:request) { gql_request(mutation) }

    it 'calls Authentication::EmailSignInService' do
      expect(::Authentication::EmailSignInService).to receive(:call).with(email, password)
      request
    end

    it 'returns authToken' do
      request
      expect(json[:data][:emailSignIn][:authToken]).to be_present.and(be_a(String))
    end

    it 'returns correct user' do
      request
      expect(json[:data][:emailSignIn][:user][:id]).to eq user.id.to_s
    end
  end
end
