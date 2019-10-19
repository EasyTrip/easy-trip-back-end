# frozen_string_literal: true

if Rails.env.development?
  GraphiQL::Rails.config.headers['Authorization'] = lambda do |_context|
    "Bearer #{Authentication::SignIn.call('admin@example.com', 'admin')[:token]}"
  end
end
