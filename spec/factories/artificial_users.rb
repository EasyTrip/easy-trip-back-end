# frozen_string_literal: true

FactoryBot.define do
  factory :artificial_user do
    first_name { 'MyString' }
    last_name { 'MyString' }
    trip { nil }
  end
end
