# frozen_string_literal: true

FactoryBot.define do
  factory :artificial_user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    association :creator, factory: :user
  end
end
