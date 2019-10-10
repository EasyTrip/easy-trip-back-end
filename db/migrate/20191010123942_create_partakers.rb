# frozen_string_literal: true

class CreatePartakers < ActiveRecord::Migration[6.0]
  def change
    create_table :partakers do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :membership, null: false, foreign_key: true

      t.timestamps
    end
  end
end
