# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    trip { nil }
    name { 'MyString' }
    description { 'MyText' }
  end
end
