# frozen_string_literal: true

class Expense < ApplicationRecord
  monetize :price_cents

  has_many :partakers, dependent: :destroy
  belongs_to :trip

  validates :name, presence: true
end
