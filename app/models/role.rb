# frozen_string_literal: true

class Role < ApplicationRecord
  scopify

  has_many :users_roles, dependent: :destroy
  has_many :users, through: :users_roles
  belongs_to :resource, polymorphic: true, optional: true

  enum name: { admin: 'admin' }

  validates :resource_type, inclusion: { in: Rolify.resource_types }, allow_nil: true
end
