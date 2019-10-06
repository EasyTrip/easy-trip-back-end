# frozen_string_literal: true

class Trip < ApplicationRecord
  has_many :users_trips, dependent: :destroy
  has_many :users, through: :users_trips
end
