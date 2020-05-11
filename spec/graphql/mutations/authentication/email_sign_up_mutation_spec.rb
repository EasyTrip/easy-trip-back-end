# frozen_string_literal: true

describe Mutations::Authentication::EmailSignUpMutation, type: :request do
  let(:query) do
    <<~GQL
      mutation {
        emailSignUp(email: "#{email}",
                    firstName: "#{first_name}",
                    lastName: "#{last_name}",
                    password: "#{password}"
                    passwordConfirmation: "#{password_confirmation}") {
          id
          email
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
    subject(:request) { gql_request(query) }

    let(:email) { Faker::Internet.email }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:password) { Faker::Internet.password }
    let(:password_confirmation) { password }

    it 'calls Authentication::EmailSignUnService' do
      expect(::Authentication::EmailSignUpService).to receive(:call).with(
        email: email,
        first_name: first_name,
        last_name: last_name,
        password: password,
        password_confirmation: password_confirmation
      )
      request
    end

    it 'returns correct user' do
      request
      expect(json[:data][:emailSignUp]).to include(id: kind_of(String),
                                                   email: email,
                                                   firstName: first_name,
                                                   lastName: last_name)
    end
  end
end
