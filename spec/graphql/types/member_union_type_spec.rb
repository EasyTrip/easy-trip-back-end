# frozen_string_literal: true

describe Types::MemberUnionType do
  describe '.resolve_type' do
    subject(:resolved_type) { described_class.resolve_type(object, nil) }

    context 'when object is User' do
      let(:object) { create(:user) }

      it 'returns UserType' do
        expect(resolved_type).to eq Types::UserType
      end
    end

    context 'when object is ArtificialUser' do
      let(:object) { create(:artificial_user) }

      it 'returns ArtificialUserType' do
        expect(resolved_type).to eq Types::ArtificialUserType
      end
    end
  end
end
