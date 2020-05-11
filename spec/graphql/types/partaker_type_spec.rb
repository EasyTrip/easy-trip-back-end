# frozen_string_literal: true

describe Types::PartakerType do
  subject { described_class }

  it { is_expected.to have_field(:id).of_type('ID!') }
  it { is_expected.to have_field(:created_at).of_type('ISO8601DateTime!') }
  it { is_expected.to have_field(:updated_at).of_type('ISO8601DateTime!') }

  it { is_expected.to have_field(:payment_price).of_type('String') }
  it { is_expected.to have_field(:payment_price_currency).of_type('String') }
  it { is_expected.to have_field(:expense).of_type('Expense!') }
  it { is_expected.to have_field(:member).of_type('MemberUnion!') }
end
