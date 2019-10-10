# frozen_string_literal: true

class Membership < ApplicationRecord
  MEMBER_TYPES = [User, ArtificialUser].map(&:name).freeze

  has_many :partakers, dependent: :destroy
  belongs_to :trip
  belongs_to :member, polymorphic: true

  validates :member_type, inclusion: { in: MEMBER_TYPES }
  validates :member_id, uniqueness: { scope: %i[trip_id member_type] }
end
