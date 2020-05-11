# frozen_string_literal: true

describe Authentication::EmailSignInService do
  describe '.call' do
    let!(:user) { create(:user, email_identity_attributes: { email: email, password: password }) }
    let(:email) { Faker::Internet.email }
    let(:password) { Faker::Internet.password }

    context 'with correct credentials' do
      subject(:sign_in) { described_class.call(email, password) }

      it 'returns user and auth_token' do
        expect(sign_in).to include(user: user, auth_token: kind_of(String))
      end
    end

    context 'with invalid credentials' do
      subject(:sign_in) { described_class.call(email, "#{password}-2") }

      it 'raises AuthenticationError' do
        expect { sign_in }.to raise_error AuthenticationError
      end
    end
  end
end
