# frozen_string_literal: true

class CreateArtificialUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :artificial_users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.timestamps
    end
  end
end
