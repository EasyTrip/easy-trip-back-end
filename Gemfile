# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Dynamically retrieve version from .ruby-version file
ruby File.open('.ruby-version').readline.chomp.delete_prefix('ruby-').delete_suffix('@easy-trip')

gem 'bcrypt'
gem 'bootsnap', require: false
gem 'graphql'
gem 'jwt'
gem 'money-rails'
gem 'pg'
gem 'puma'
gem 'pundit'
gem 'rack-cors'
gem 'rails'
gem 'rolify'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-i18n'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
  gem 'rubocop-rspec'
  gem 'rubocop-thread_safety'
end

group :development do
  gem 'database_consistency', require: false
  gem 'graphiql-rails'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  # Add this to fix issue from v 4.0. Should be removed after fix in
  # https://github.com/rails/sprockets-rails/issues/444
  # https://github.com/rails/sprockets-rails/issues/443
  # https://github.com/rails/sprockets-rails/issues/448
  gem 'sprockets', '~>3.0'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-graphql_matchers'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end
