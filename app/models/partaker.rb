# frozen_string_literal: true

class Partaker < ApplicationRecord
  has_one :payment, dependent: :destroy
  belongs_to :expense
  belongs_to :membership
end
