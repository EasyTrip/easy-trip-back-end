# frozen_string_literal: true

FactoryBot.define do
  factory :expense do
    trip
    name { 'MyString' }
    description { 'MyText' }
  end
end
