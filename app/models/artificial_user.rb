# frozen_string_literal: true

class ArtificialUser < ApplicationRecord
  has_many :memberships, as: :member, dependent: :destroy
end
