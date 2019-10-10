# frozen_string_literal: true

class Trip < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :expenses, dependent: :destroy
  belongs_to :creator, class_name: 'User', inverse_of: :trips

  validates :name, presence: true
end
