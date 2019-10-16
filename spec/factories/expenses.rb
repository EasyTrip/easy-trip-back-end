# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    trip
    name { Faker::Food.dish }
    description { Faker::Food.description }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
