# frozen_string_literal: true

class RemoveRedundantIndexes < ActiveRecord::Migration[6.1]
  def change
    remove_index(:users_roles, :user_id)
    remove_index(:friendships, :friend_id)
  end
end
