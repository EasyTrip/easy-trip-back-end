# frozen_string_literal: true

RSpec.describe TripPolicy do
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
end
