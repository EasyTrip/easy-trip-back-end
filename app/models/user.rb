# frozen_string_literal: true

class User < ApplicationRecord
  rolify

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :trips, foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :artificial_users, foreign_key: :creator_id, dependent: :destroy, inverse_of: :creator
  has_many :trip_memberships, as: :member, dependent: :destroy
  has_one :email_identity, dependent: :destroy

  validates :first_name, :last_name, :email_identity, presence: true

  delegate :email, to: :email_identity

  accepts_nested_attributes_for :email_identity

  def sign_in!
    self.sign_in_count += 1
    self.last_sign_in_at = current_sign_in_at
    self.current_sign_in_at = Time.current
    save!
  end
end
