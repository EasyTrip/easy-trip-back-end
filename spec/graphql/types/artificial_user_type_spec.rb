# frozen_string_literal: true

RSpec.describe Types::ArtificialUserType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:first_name).of_type('String!') }
  it { is_expected.to have_field(:last_name).of_type('String!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  it { is_expected.to have_field(:creator).of_type('User!') }
end
