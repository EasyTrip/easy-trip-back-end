# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_group 'Services', 'app/services'
  add_group 'GraphQL', 'app/graphql'
end
