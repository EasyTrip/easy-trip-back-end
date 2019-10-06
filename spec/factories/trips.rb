# frozen_string_literal: true

FactoryBot.define do
  factory :trip do
    name { "MyString" }
    description { "MyText" }
    start_date { "2019-10-07 02:05:18" }
    finish_date { "2019-10-07 02:05:18" }
  end
end
