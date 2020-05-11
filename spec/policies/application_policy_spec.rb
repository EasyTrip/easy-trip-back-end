# frozen_string_literal: true

describe ApplicationPolicy do
  subject { described_class }

  let(:user) { create(:user) }

  permissions :index?, :show?, :create?, :update?, :destroy? do
    let(:object) { Object.new }

    it { is_expected.not_to permit(user, object) }
  end

  describe described_class::Scope do
    subject(:scope) { described_class.new(user, User).resolve }

    it 'returns all users' do
      expect(scope.count).to eq User.count
    end
  end
end
