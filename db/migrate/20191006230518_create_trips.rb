# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.text :description
      t.references :creator, references: :users, null: false
      t.timestamp :start_date
      t.timestamp :finish_date

      t.timestamps
    end

    add_foreign_key :trips, :users, column: :creator_id
  end
end
