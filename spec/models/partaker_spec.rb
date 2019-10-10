# frozen_string_literal: true

RSpec.describe Partaker, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:payment).dependent(:destroy) }
    it { is_expected.to belong_to(:expense) }
    it { is_expected.to belong_to(:membership) }
    it { is_expected.to have_db_index(:expense_id) }
    it { is_expected.to have_db_index(:membership_id) }
  end
end
