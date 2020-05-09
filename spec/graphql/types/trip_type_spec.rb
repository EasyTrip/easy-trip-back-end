# frozen_string_literal: true

RSpec.describe Types::TripType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:name).of_type('String!') }
  it { is_expected.to have_field(:description).of_type('String') }
  it { is_expected.to have_field(:start_date).of_type('ISO8601DateTime') }
  it { is_expected.to have_field(:finish_date).of_type('ISO8601DateTime') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  it { is_expected.to have_field(:expenses).of_type('[Expense!]!') }
  it { is_expected.to have_field(:creator).of_type('User!') }
end
