# frozen_string_literal: true

class Partaker < ApplicationRecord
  has_one :payment, dependent: :destroy
  belongs_to :expense
  belongs_to :trip_membership

  delegate :member, to: :trip_membership
  delegate :price, :price_currency, to: :payment, prefix: true, allow_nil: true
end
