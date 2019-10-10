# frozen_string_literal: true

class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :partaker, null: false, foreign_key: true, index: { unique: true }
      t.monetize :price

      t.timestamps
    end
  end
end
