# frozen_string_literal: true

class Partaker < ApplicationRecord
  has_one :payment, dependent: :destroy
  belongs_to :expense
  belongs_to :membership

  delegate :member, to: :membership
  delegate :price, :price_currency, to: :payment, prefix: true, allow_nil: true
end
