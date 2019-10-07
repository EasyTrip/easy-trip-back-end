# frozen_string_literal: true

class Expense < ApplicationRecord
  monetize :price_cents

  belongs_to :trip
end
