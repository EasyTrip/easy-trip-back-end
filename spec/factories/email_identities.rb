# frozen_string_literal: true

FactoryBot.define do
  factory :email_identity do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { '1q2w3e4r' }

    after(:build) do |email_identity|
      email_identity.user ||= build(:user)
    end
  end
end
