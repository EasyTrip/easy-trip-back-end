# frozen_string_literal: true

RSpec.describe Types::MutationType do
  subject { described_class }

  it { is_expected.to have_field(:email_sign_up).of_type('User') }
  it { is_expected.to have_field(:email_sign_in).of_type('EmailSignInMutationPayload') }

  it { is_expected.to have_field(:create_trip).of_type('Trip') }
  it { is_expected.to have_field(:update_trip).of_type('Trip') }
  it { is_expected.to have_field(:destroy_trip).of_type('Trip') }

  it { is_expected.to have_field(:create_expense).of_type('Expense') }
  it { is_expected.to have_field(:update_expense).of_type('Expense') }
  it { is_expected.to have_field(:destroy_expense).of_type('Expense') }
end
