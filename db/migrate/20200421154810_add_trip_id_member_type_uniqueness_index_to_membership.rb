# frozen_string_literal: true

class AddTripIdMemberTypeUniquenessIndexToMembership < ActiveRecord::Migration[6.0]
  def change
    add_index :memberships, %i[member_id trip_id member_type], unique: true
  end
end
