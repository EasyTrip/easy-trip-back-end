# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    name { Faker::Movies::HarryPotter.location }
    description { Faker::Movies::HarryPotter.quote }
    association :creator, factory: :user
    start_date { '2019-10-07 02:05:18' }
    finish_date { '2019-10-07 02:05:18' }
  end
end
