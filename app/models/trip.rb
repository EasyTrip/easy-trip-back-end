# frozen_string_literal: true

class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User'
end
