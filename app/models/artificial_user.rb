# frozen_string_literal: true

class ArtificialUser < ApplicationRecord
  has_many :memberships, as: :member, dependent: :destroy
  belongs_to :creator, class_name: 'User', inverse_of: :artificial_users

  validates :first_name, :last_name, presence: true

  # TODO: This is duplicate of method in user.rb
  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
