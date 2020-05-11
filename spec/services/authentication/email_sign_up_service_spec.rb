# frozen_string_literal: true

describe Authentication::EmailSignUpService do
  subject(:sign_up) do
    described_class.call(email: email,
                         first_name: first_name,
                         last_name: last_name,
                         password: password,
                         password_confirmation: password_confirmation)
  end

  describe '.call' do
    let(:email) { Faker::Internet.email }
    let(:first_name) { Faker::Name.first_name }
    let(:last_name) { Faker::Name.last_name }
    let(:password) { Faker::Internet.password }
    let(:password_confirmation) { password }

    context 'with valid parameters' do
      it 'creates new user' do
        expect { sign_up }.to change(User, :count).by 1
      end

      it 'returns user' do
        expect(sign_up).to be_a User
      end

      it 'returns use with correct params', :aggregate_failures do
        expect(sign_up.email).to eq email
        expect(sign_up.first_name).to eq first_name
        expect(sign_up.last_name).to eq last_name
      end
    end

    context 'with invalid password_confirmation' do
      let(:password_confirmation) { "#{password}-2" }

      it 'raises an error' do
        expect { sign_up }.to raise_error ActiveRecord::RecordInvalid,
                                          'Validation failed: Email identity ' \
                                          "password confirmation doesn't match Password"
      end
    end

    context 'with invalid email' do
      let(:email) { 'invalid_email' }

      it 'raises an error' do
        expect { sign_up }.to raise_error ActiveRecord::RecordInvalid,
                                          'Validation failed: Email identity email is invalid'
      end
    end
  end
end
