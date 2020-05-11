# frozen_string_literal: true

describe Types::ExpenseType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:name).of_type('String!') }
  it { is_expected.to have_field(:description).of_type('String') }
  it { is_expected.to have_field(:price).of_type('String!') }
  it { is_expected.to have_field(:price_currency).of_type('String!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  it { is_expected.to have_field(:partakers).of_type('[Partaker!]!') }
  it { is_expected.to have_field(:trip).of_type('Trip!') }
end
