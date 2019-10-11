# frozen_string_literal: true

RSpec.describe ApplicationRecord, type: :model do
  describe '.abstract_class' do
    it { expect(described_class).to be_abstract_class }
  end
end
