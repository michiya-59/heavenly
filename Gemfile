# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.1"

gem "activestorage-cloudinary-service", "~> 0.2.3"
gem "active_storage_validations" # 画像ファイルのバリデーション用
gem "importmap-rails"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 7.1.3"
gem "sprockets-rails"
# gem "turbo-rails"
gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "dartsass-rails", "~> 0.5.0"
gem "dotenv-rails"
gem "image_processing", "~> 1.2"
gem "jbuilder"
gem "kredis"
gem "redis", ">= 4.0.1"
gem "stimulus-rails"
gem "tzinfo-data", platforms: %i(mswin mswin64 mingw x64_mingw jruby)

group :development, :test do
  gem "brakeman"
  gem "bullet"
  gem "byebug", platforms: %i(mri mingw x64_mingw)
  gem "debug", platforms: %i(mri mswin mswin64 mingw x64_mingw)
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "spring-commands-rspec"
end

group :development do
  gem "rack-mini-profiler"
  gem "spring"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
