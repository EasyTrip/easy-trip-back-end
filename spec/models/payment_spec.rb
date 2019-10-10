# frozen_string_literal: true

RSpec.describe Payment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:partaker) }
    it { is_expected.to have_db_index(:partaker_id).unique }
  end

  describe 'validations' do
    subject { create(:payment) }

    it { is_expected.to validate_uniqueness_of(:partaker_id) }
  end

  describe 'money' do
    it { is_expected.to monetize(:price) }
  end
end
