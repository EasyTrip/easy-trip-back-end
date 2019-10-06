# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :users_trips, dependent: :destroy
  has_many :trips, through: :users_trips
  has_one_attached :avatar

  validates :email, :first_name, :last_name, presence: true

  scope :contacts, ->(user) { where.not(id: user.id) }

  def full_name
    [first_name, last_name].compact.join(' ')
  end

  def sign_in
    self.sign_in_count += 1
    self.last_sign_in_at = current_sign_in_at
    self.current_sign_in_at = Time.current
    save
  end
end
