# frozen_string_literal: true

describe Types::TripMembershipType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:trip).of_type('Trip!') }
  it { is_expected.to have_field(:member).of_type('MemberUnion!') }
  it { is_expected.to have_field(:member_type).of_type('MemberTypeEnum!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }
end
