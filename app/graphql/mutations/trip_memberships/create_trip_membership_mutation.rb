# frozen_string_literal: true

module Mutations
  module TripMemberships
    class CreateTripMembershipMutation < BaseMutation
      type Types::TripMembershipType

      argument :trip_id, ID, required: true
      argument :member_id, ID, required: true
      argument :member_type, ::Types::MemberTypeEnumType, required: true

      def resolve(trip_id:, member_id:, member_type:)
        Trip.find(trip_id)
            .tap { |trip| authorize trip }
            .trip_memberships
            .create!(member_id: member_id, member_type: member_type)
      end
    end
  end
end
