# frozen_string_literal: true

if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = lambda do |_context|
    "Bearer #{Authentication::EmailSignIn.call('admin@example.com', 'admin')[:auth_token]}"
  end
end
