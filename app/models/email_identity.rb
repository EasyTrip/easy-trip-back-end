# frozen_string_literal: true

class EmailIdentity < ApplicationRecord
  has_secure_password

  belongs_to :user

  validates :email, :password_digest, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, :user_id, uniqueness: true
end
