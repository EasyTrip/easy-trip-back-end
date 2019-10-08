# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :memberships, dependent: :destroy

  validates :name, presence: true
end
