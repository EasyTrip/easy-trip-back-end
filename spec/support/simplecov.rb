# frozen_string_literal: true

require 'simplecov'

# RSpec will fail if coverage is under 100%
SimpleCov.minimum_coverage 100 if ActiveModel::Type::Boolean.new.cast(ENV['CI'])

SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
  add_group 'GraphQL', 'app/graphql'
  add_group 'Policies', 'app/policies'
end
