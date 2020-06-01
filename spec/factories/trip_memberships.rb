# frozen_string_literal: true

FactoryBot.define do
  factory :trip_membership do
    trip
    # default member for automatically created chained factories
    association :member, factory: :artificial_user

    trait :with_user do
      association :member, factory: :user
    end

    trait :with_artificial_user do
      association :member, factory: :artificial_user
    end
  end
end
