# frozen_string_literal: true

describe Types::UserType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:email).of_type('String!') }
  it { is_expected.to have_field(:first_name).of_type('String!') }
  it { is_expected.to have_field(:last_name).of_type('String!') }
  it { is_expected.to have_field(:sign_in_count).of_type('Int!') }
  it { is_expected.to have_field(:current_sign_in_at).of_type('ISO8601DateTime') }
  it { is_expected.to have_field(:last_sign_in_at).of_type('ISO8601DateTime') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  it { is_expected.to have_field(:trips).of_type('[Trip!]!') }
end
