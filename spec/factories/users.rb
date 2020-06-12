# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    after(:build) do |user|
      user.email_identity ||= build(:email_identity, user: user)
    end

    factory :admin do
      after(:build) do |user|
        user.add_role(:admin)
      end
    end
  end
end
