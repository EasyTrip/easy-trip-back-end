# frozen_string_literal: true

class UsersTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
end