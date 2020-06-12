# frozen_string_literal: true

describe Role, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:users_roles).dependent(:destroy) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to belong_to(:resource).optional }
    it { is_expected.to have_db_index(%i[resource_type resource_id]) }
    it { is_expected.to have_db_index(%i[name resource_type resource_id]) }
  end

  describe 'validations' do
    it { is_expected.to define_enum_for(:name).with_values(admin: 'admin').backed_by_column_of_type(:string) }

    describe 'inclusion' do
      let(:resource_types) { Rolify.resource_types }

      it { is_expected.to validate_inclusion_of(:resource_type).in_array(resource_types).allow_nil }
    end
  end
end
