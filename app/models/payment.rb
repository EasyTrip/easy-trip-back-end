# frozen_string_literal: true

class Payment < ApplicationRecord
  monetize :price_cents

  belongs_to :partaker

  validates :partaker_id, uniqueness: true
end
