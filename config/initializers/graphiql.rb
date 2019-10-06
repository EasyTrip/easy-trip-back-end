# frozen_string_literal: true

GraphiQL::Rails.config.headers['Authorization'] = lambda do |_context|
  "Bearer #{Authentication::Login.call('admin@example.com', 'admin')}"
end
