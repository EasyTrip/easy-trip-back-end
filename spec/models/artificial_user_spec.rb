# frozen_string_literal: true

RSpec.describe ArtificialUser, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to belong_to(:creator).class_name(User.name).inverse_of(:artificial_users) }
    it { is_expected.to have_db_index(:creator_id) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end
end
