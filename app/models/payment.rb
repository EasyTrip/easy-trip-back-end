# frozen_string_literal: true

class Payment < ApplicationRecord
  belongs_to :partaker

  validates :partaker_id, uniqueness: true
end
