# frozen_string_literal: true

describe Types::MemberTypeEnumType do
  it 'has User, ArtificialUser values' do
    expect(described_class.values.keys).to contain_exactly(*TripMembership::MEMBER_TYPES)
  end
end
