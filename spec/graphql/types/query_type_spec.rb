# frozen_string_literal: true

RSpec.describe Types::QueryType do
  subject { described_class }

  it { is_expected.to have_field(:current_user).of_type('User!') }
  it { is_expected.to have_field(:users).of_type('[User!]!') }
  it { is_expected.to have_field(:user).of_type('User!') }

  it { is_expected.to have_field(:trips).of_type('[Trip!]!') }
  it { is_expected.to have_field(:trip).of_type('Trip!') }

  it { is_expected.to have_field(:expenses).of_type('[Expense!]!') }
  it { is_expected.to have_field(:expense).of_type('Expense!') }
end
