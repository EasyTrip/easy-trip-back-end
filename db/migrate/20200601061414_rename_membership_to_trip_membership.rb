# frozen_string_literal: true

class RenameMembershipToTripMembership < ActiveRecord::Migration[6.0]
  def change
    rename_table :memberships, :trip_memberships
    rename_column :partakers, :membership_id, :trip_membership_id
  end
end
