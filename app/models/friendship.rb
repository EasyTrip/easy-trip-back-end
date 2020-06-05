# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  enum status: { pending: 0, approved: 1, declined: 2, blocked: 3 }

  validates :status, presence: true
  validates :friend_id, uniqueness: { scope: :user_id }
  validate :user_not_eq_friend

  private

  def user_not_eq_friend
    errors.add(:friend, 'should not be the same as user') if user_id == friend_id
  end
end
