# frozen_string_literal: true

describe Expense, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:partakers).dependent(:destroy) }
    it { is_expected.to belong_to(:trip) }
    it { is_expected.to have_db_index(:trip_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe 'money' do
    it { is_expected.to monetize(:price) }
  end
end
