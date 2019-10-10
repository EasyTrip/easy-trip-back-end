# frozen_string_literal: true

class Expense < ApplicationRecord
  monetize :price_cents

  has_many :partakers, dependent: :destroy
  belongs_to :trip

  validates :name, :price_cents, :price_currency, presence: true
end
