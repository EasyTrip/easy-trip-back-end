# frozen_string_literal: true

module Types
  module Base
    class Object < GraphQL::Schema::Object
      def self.authorized?(object, context)
        context[:pundit].send(:authorize, object, 'show?')
      end
    end
  end
end
