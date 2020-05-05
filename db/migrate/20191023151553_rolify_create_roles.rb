# frozen_string_literal: true

class RolifyCreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table(:roles) do |t|
      t.string :name, null: false
      t.references :resource, polymorphic: true

      t.timestamps
    end

    create_table(:users_roles, id: false) do |t|
      t.references :user, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end

    add_index(:roles, %i[name resource_type resource_id])
    add_index(:users_roles, %i[user_id role_id])
  end
end
