# frozen_string_literal: true

describe Mutations::Trips::CreateTripMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        createTrip(name: "#{name}",
                   description: "#{description}",
                   startDate: "#{start_date}",
                   finishDate: "#{finish_date}") {
          id
          name
          description
          startDate
          finishDate
        }
      }
    GQL
  end

  let(:user) { create(:user) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    let(:name) { Faker::Movies::HarryPotter.location }
    let(:description) { Faker::Movies::HarryPotter.quote }
    let(:start_date) { 1.day.from_now.iso8601 }
    let(:finish_date) { 2.days.from_now.iso8601 }

    context 'when user is authenticated' do
      it 'creates a trip' do
        expect { request }.to change(Trip, :count).by 1
      end

      it 'returns a trip' do
        request
        expect(json[:data][:createTrip]).to include(id: kind_of(String),
                                                    name: name,
                                                    description: description,
                                                    startDate: start_date,
                                                    finishDate: finish_date)
      end
    end

    it_behaves_like 'when user is guest' do
      let(:query) { mutation }
    end
  end
end
