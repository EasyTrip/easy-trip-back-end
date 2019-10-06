# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :sign_in_count, Integer, null: false
    field :current_sign_in_at, String, null: true
    field :last_sign_in_at, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true

    field :full_name, String, null: false

    delegate :full_name, to: :object
  end
end
