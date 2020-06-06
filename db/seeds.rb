# frozen_string_literal: true

# This file should contain all the record creation needed
# to seed the database with its default values.
# The data can then be loaded with the
# rails db:seed command (or created alongside the database with db:setup).

class Seed
  TRIP_NAMES = [
    -> { [Faker::Movies::HarryPotter.location, Faker::Movies::HarryPotter.quote] },
    -> { [Faker::Movies::Hobbit.location, Faker::Movies::Hobbit.quote] },
    -> { [Faker::Movies::LordOfTheRings.location, Faker::Movies::LordOfTheRings.quote] },
    -> { [Faker::Movies::StarWars.planet, Faker::Movies::StarWars.quote] },
    -> { [Faker::Address.country, Faker::TvShows::Friends.quote] }
  ].freeze
  EXPENSE_NAMES = [
    -> { [Faker::Device.model_name, Faker::Device.platform] },
    -> { [Faker::Food.dish, Faker::Food.description] },
    -> { [Faker::Dessert.variety, Faker::Dessert.flavor] },
    -> { [Faker::Beer.brand, Faker::Beer.alcohol] },
    -> { [Faker::Beer.name, Faker::Beer.style] }
  ].freeze
  CURRENCIES = %w[UAH EUR USD].freeze

  class << self
    def call(user_amount = 1)
      user_amount.times do
        user = create_user
        create_trips(user)
      rescue StandardError => e
        Rails.logger.info e.message
        next
      end
      make_friends
    end

    private

    def create_user
      Authentication::EmailSignUpService.call(email: Faker::Internet.email,
                                              first_name: Faker::Name.first_name,
                                              last_name: Faker::Name.last_name,
                                              password: 'password',
                                              password_confirmation: 'password')
    end

    def create_trips(user, from_date = 2.years.ago.to_date, to_date = 1.year.from_now.to_date)
      rand(10).times do
        name, description = TRIP_NAMES.sample.call
        start_date = Faker::Date.between(from: from_date, to: to_date).to_date
        finish_date = Faker::Date.between(from: start_date, to: to_date)
        trip_attributes = { name: name,
                            description: description,
                            start_date: start_date,
                            finish_date: finish_date }
        trip = Trips::CreateService.call(user, **trip_attributes)
        create_expenses(trip)
      end
    end

    def create_expenses(trip)
      rand(10).times do
        name, description = EXPENSE_NAMES.sample.call
        price = rand(5000)
        currency = CURRENCIES.sample
        trip.expenses.create!(name: name, description: description, price: price, price_currency: currency)
      end
    end

    def make_friends
      User.all.each do |user|
        rand(10).times do
          friends_id = user.friends.pluck(:id) << user.id
          friend = User.where.not(id: friends_id).order('RANDOM()').first
          next unless friend

          user.friendships.create!(friend: friend, status: :approved)
        end
      end
    end
  end
end

Seed.call(1)
