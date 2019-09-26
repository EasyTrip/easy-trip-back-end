# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :created_at, String, null: true
    field :updated_at, String, null: true

    field :full_name, String, null: false

    def full_name
      object.full_name
    end
  end
end
