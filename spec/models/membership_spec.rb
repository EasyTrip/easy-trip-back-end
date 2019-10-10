# frozen_string_literal: true

RSpec.describe Membership, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:partakers).dependent(:destroy) }
    it { is_expected.to belong_to(:trip) }
    it { is_expected.to belong_to(:member) }
    it { is_expected.to have_db_index(:trip_id) }
    it { is_expected.to have_db_index(%i[member_type member_id]) }
  end

  describe 'validations' do
    describe 'inclusion' do
      let(:member_types) { described_class::MEMBER_TYPES }

      it { is_expected.to validate_inclusion_of(:member_type).in_array(member_types) }
    end

    describe 'uniqueness' do
      subject { create(:membership, :with_artificial_user) }

      it { is_expected.to validate_uniqueness_of(:member_id).scoped_to(%i[trip_id member_type]) }
    end
  end
end
