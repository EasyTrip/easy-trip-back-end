# frozen_string_literal: true

describe Trips::CreateService do
  subject(:create_trip) { described_class.call(user, **attributes) }

  let(:user) { create(:user) }
  let(:attributes) { { name: name, description: description, start_date: start_date, finish_date: finish_date } }
  let(:name) { Faker::Movies::HarryPotter.location }
  let(:description) { Faker::Movies::HarryPotter.quote }
  let(:start_date) { 1.day.from_now.iso8601 }
  let(:finish_date) { 2.days.from_now.iso8601 }

  it 'creates 1 Trip' do
    expect { create_trip }.to change(Trip, :count).by 1
  end

  it 'creates correct Trip', :aggregate_failures do
    expect(create_trip.name).to eq(name)
    expect(create_trip.description).to eq(description)
    expect(create_trip.start_date).to eq(start_date)
    expect(create_trip.finish_date).to eq(finish_date)
    expect(create_trip.creator).to eq(user)
  end

  it 'creates 1 TripMembership' do
    expect { create_trip }.to change(TripMembership, :count).by 1
  end

  it 'creates correct TripMembership' do
    expect(create_trip.trip_memberships.first.member).to eq(user)
  end
end
