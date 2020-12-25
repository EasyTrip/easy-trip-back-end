# frozen_string_literal: true

describe TripPolicy do
  subject { described_class }

  permissions :index? do
    let(:user) { create(:user) }

    it { is_expected.to permit(user, Trip) }
  end

  permissions :create? do
    let(:user) { create(:user) }

    it { is_expected.to permit(user, Trip) }
  end

  permissions :show?, :update?, :destroy? do
    let(:trip) { create(:trip) }

    context 'when user is admin' do
      let(:user) { create(:admin) }

      it { is_expected.to permit(user, trip) }
    end

    context 'when user is trip creator' do
      let(:user) { trip.creator }

      it { is_expected.to permit(user, trip) }
    end

    context 'when trip is not accessible to user' do
      let(:user) { create(:user) }

      it { is_expected.not_to permit(user, trip) }
    end
  end

  describe described_class::Scope do
    subject(:scope) { described_class.new(user, Trip).resolve }

    let(:trips) { create_pair(:trip) }
    let(:user) { trips.first.creator }

    context 'when user is admin' do
      before { user.add_role(Role::ADMIN) }

      it 'returns all trips' do
        expect(scope.count).to eq trips.count
      end
    end

    context 'when user is not admin' do
      it 'returns one trip' do
        expect(scope.count).to eq 1
      end
    end
  end
end
