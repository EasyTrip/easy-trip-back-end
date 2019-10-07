# frozen_string_literal: true

class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :trip, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.monetize :price

      t.timestamps
    end
  end
end
