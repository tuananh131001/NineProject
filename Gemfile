# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# System
ruby '3.1.2'

gem 'pg'
gem 'rails', '~> 7.0.6'
gem 'rake'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i(mingw mswin x64_mingw jruby)

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

gem 'bcrypt'

gem 'jwt'

gem 'rswag'

group :development, :test do
  gem 'dead_end' # find unmatched 'end' in code
  gem 'pry-byebug'
  gem 'rspec_api_documentation'
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'rubocop-factory_bot'
  gem 'rubocop-rails', '~> 2.20'
  gem 'rubocop-rspec'
end

group :test do
  gem 'mock_redis'
  gem 'rspec-rails'
  gem 'rspec-sidekiq', '~> 3.1'

  gem 'factory_bot_rails'
  gem 'faker'
  gem 'timecop'
  gem 'webmock'

  gem 'sinatra'

  gem 'fakeredis', require: 'fakeredis/rspec'

  gem 'database_cleaner-active_record'
end

group :production, :staging do
  gem 'puma', '~> 6.3'
end
