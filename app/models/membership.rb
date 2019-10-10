# frozen_string_literal: true

class Membership < ApplicationRecord
  has_many :partakers, dependent: :destroy
  belongs_to :trip
  belongs_to :member, polymorphic: true

  validates :member_type, inclusion: { in: [User, ArtificialUser].map(&:to_s) }
  validates :member_id, uniqueness: { scope: %i[trip_id member_type] }
end
