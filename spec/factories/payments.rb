# frozen_string_literal: true

FactoryBot.define do
  factory :payment do
    partaker
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
