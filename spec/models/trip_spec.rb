# frozen_string_literal: true

RSpec.describe Trip, type: :model do
  it { is_expected.to belong_to(:creator) }
end
