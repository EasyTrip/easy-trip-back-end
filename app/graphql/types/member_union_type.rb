# frozen_string_literal: true

module Types
  class MemberUnionType < Types::Base::Union
    description 'Represents User or ArtificialUser'
    possible_types UserType, ArtificialUserType

    def self.resolve_type(object, _context)
      case object
      when User
        UserType
      when ArtificialUser
        ArtificialUserType
      end
    end
  end
end
