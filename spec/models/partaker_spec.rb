# frozen_string_literal: true

describe Partaker, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:payment).dependent(:destroy) }
    it { is_expected.to belong_to(:expense) }
    it { is_expected.to belong_to(:membership) }
    it { is_expected.to have_db_index(:expense_id) }
    it { is_expected.to have_db_index(:membership_id) }
  end

  describe 'delegation' do
    it { is_expected.to delegate_method(:member).to(:membership) }
    it { is_expected.to delegate_method(:price).to(:payment).with_prefix.allow_nil }
    it { is_expected.to delegate_method(:price_currency).to(:payment).with_prefix.allow_nil }
  end
end
