# frozen_string_literal: true

describe EmailIdentity, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_db_index(:email).unique }
    it { is_expected.to have_db_index(:user_id).unique }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value(Faker::Internet.email).for(:email) }
    it { is_expected.not_to allow_value('invalid_email').for(:email) }
    it { is_expected.to validate_presence_of(:password_digest) }

    describe 'uniqueness' do
      subject { create(:email_identity) }

      it { is_expected.to validate_uniqueness_of(:user_id) }
      it { is_expected.to validate_uniqueness_of(:email) }
    end
  end

  describe 'secure password' do
    it { is_expected.to have_secure_password }
  end
end
