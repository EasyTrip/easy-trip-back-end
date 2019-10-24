# frozen_string_literal: true

RSpec.describe UsersRole, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:role) }
    it { is_expected.to have_db_index(:role_id) }
    it { is_expected.to have_db_index(:user_id) }
    it { is_expected.to have_db_index(%i[user_id role_id]) }
  end
end
