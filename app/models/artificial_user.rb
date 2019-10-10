# frozen_string_literal: true

class ArtificialUser < ApplicationRecord
  has_many :memberships, as: :member, dependent: :destroy
  belongs_to :creator, class_name: 'User'

  validates :first_name, :last_name, presence: true
end
