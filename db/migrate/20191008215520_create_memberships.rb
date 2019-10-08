# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :member, polymorphic: true, null: false

      t.timestamps
    end
  end
end
