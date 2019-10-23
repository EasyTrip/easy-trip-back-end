# frozen_string_literal: true

class Role < ApplicationRecord
  scopify

  WHITELIST = [
    ADMIN = 'admin'
  ].freeze

  has_many :users_roles, dependent: :destroy
  has_many :users, through: :users_roles
  belongs_to :resource, polymorphic: true, optional: true

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true
  validates :name, inclusion: { in: WHITELIST }
end
