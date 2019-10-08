# frozen_string_literal: true

class Expense < ApplicationRecord
  monetize :price_cents

  belongs_to :trip

  validates :name, :price_cents, :price_currency, presence: true
end
