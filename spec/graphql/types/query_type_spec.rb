# frozen_string_literal: true

RSpec.describe Types::QueryType do
  describe 'users' do
    subject { EasyTripBackEndSchema.execute(query).as_json }

    let!(:users) { create_pair :user }
    let(:users_hash) do
      users.map do |user|
        { email: user.email,
          firstName: user.first_name,
          lastName: user.last_name }
      end.as_json
    end

    let(:query) do
      %(
        query {
          users {
            email,
            firstName,
            lastName
          }
        }
      )
    end

    it 'returns all users' do
      expect(subject.dig('data', 'users')).to match_array(users_hash)
    end
  end
end
