# frozen_string_literal: true

module Types
  class MemberTypeEnumType < Types::Base::Enum
    TripMembership::MEMBER_TYPES.each do |member_type|
      value member_type
    end
  end
end
