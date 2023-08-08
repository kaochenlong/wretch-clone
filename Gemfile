source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 6.0"
  gem "faker", "~> 3.2"
  gem "factory_bot_rails", "~> 6.2"
end

group :development do
  gem "web-console"
  gem "tailwindcss-rails", "~> 2.0"
  gem "annotate", "~> 3.2"
  gem "letter_opener", "~> 1.8"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

ruby "3.2.2"

gem "rails", "~> 7.0.6"
gem "sprockets-rails"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "braintree", "~> 4.12"
gem "aasm", "~> 5.5"
gem "acts_as_list", "~> 1.1"

gem "ransack", "~> 4.0"
gem "pundit", "~> 2.3"
gem "kaminari", "~> 1.2"
