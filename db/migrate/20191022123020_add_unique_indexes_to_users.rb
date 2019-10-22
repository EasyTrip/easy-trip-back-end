# frozen_string_literal: true

class AddUniqueIndexesToUsers < ActiveRecord::Migration[6.0]
  def change
    remove_index :email_identities, :user_id
    add_index :email_identities, :user_id, unique: true
    add_index :email_identities, :email, unique: true
  end
end
