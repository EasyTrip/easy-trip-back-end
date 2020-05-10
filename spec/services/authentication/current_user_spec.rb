# frozen_string_literal: true

describe Authentication::CurrentUser do
  subject(:current_user) { described_class.call("Bearer #{auth_token}") }

  describe '.call' do
    let(:user) { create(:user) }

    context 'with valid token' do
      let(:expiration) { Authentication::EmailSignIn::EXPIRATION_DAYS.days.from_now.to_i }
      let(:auth_token) { JsonWebToken.encode(user_id: user.id, exp: expiration) }

      it { is_expected.to eq user }
    end

    context 'with invalid expired token' do
      let(:expiration) { 1.day.ago.to_i }
      let(:auth_token) { JsonWebToken.encode(user_id: user.id, exp: expiration) }

      it 'raises expiration error' do
        expect { current_user }.to raise_error AuthenticationError, 'Auth token has expired'
      end
    end

    context 'with invalid broken token' do
      let(:auth_token) { 'broken_token' }

      it 'raises validation error' do
        expect { current_user }.to raise_error AuthenticationError, 'JWT Token is Broken'
      end
    end

    context 'with invalid token without user_id' do
      let(:expiration) { Authentication::EmailSignIn::EXPIRATION_DAYS.days.from_now.to_i }
      let(:auth_token) { JsonWebToken.encode(exp: expiration) }

      it 'raises expiration error' do
        expect { current_user }.to raise_error AuthenticationError, 'Not Authenticated'
      end
    end
  end
end
