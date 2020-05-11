# frozen_string_literal: true

describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:trips).dependent(:destroy).inverse_of(:creator) }
    it { is_expected.to have_many(:artificial_users).dependent(:destroy).inverse_of(:creator) }
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_one(:email_identity).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email_identity) }
  end

  describe 'delegation' do
    it { is_expected.to delegate_method(:email).to(:email_identity) }
  end

  describe '#sign_in!' do
    subject(:sign_in) { user.sign_in! }

    let!(:user) { create(:user, current_sign_in_at: yesterday) }
    let(:yesterday) { 1.day.ago }

    it { expect { sign_in }.to change(user, :sign_in_count).by(1) }
    it { expect { sign_in }.to change(user, :last_sign_in_at).to(user.current_sign_in_at) }

    describe 'time' do
      let(:current_time) { Time.current }

      before { allow(Time).to receive(:current).and_return(current_time) }

      it 'sets current time' do
        expect { sign_in }.to change(user, :current_sign_in_at)
          .from(yesterday).to(current_time)
      end
    end
  end
end
