# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, null: false
      t.integer :status, null: false

      t.timestamps
    end

    add_index :friendships, %i[friend_id user_id], unique: true
    add_foreign_key :friendships, :users, column: :friend_id
  end
end
