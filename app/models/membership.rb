# frozen_string_literal: true

class Membership < ApplicationRecord
  belongs_to :trip
  belongs_to :member, polymorphic: true

  validates :member_type, inclusion: { in: [User, ArtificialUser].map(&:to_s) }
end
