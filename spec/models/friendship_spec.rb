# frozen_string_literal: true

describe Friendship, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:friend).class_name(User.name) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(:friend_id) }
    it { is_expected.to have_db_index(%i[friend_id user_id]).unique }
  end

  describe 'validations' do
    describe '#user_not_eq_friend' do
      subject { build_stubbed(:friendship, user: user, friend: user) }

      let(:user) { build_stubbed(:user) }

      it { is_expected.to be_invalid }
    end

    describe 'uniqueness' do
      subject { create(:friendship) }

      it { is_expected.to validate_uniqueness_of(:friend_id).scoped_to([:user_id]) }
    end
  end
end
