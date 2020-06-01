# frozen_string_literal: true

class ArtificialUser < ApplicationRecord
  has_many :trip_memberships, as: :member, dependent: :destroy
  belongs_to :creator, class_name: 'User', inverse_of: :artificial_users

  validates :first_name, :last_name, presence: true
end
