source 'https://rubygems.org'

gem 'rails', '~> 8.0.0.rc2'
gem 'propshaft'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'importmap-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'

gem 'redcarpet'

gem 'bcrypt', "~> 3.1.7"

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'solid_cache'
gem 'solid_queue'
gem 'solid_cable'

gem 'bootsnap', require: false
gem 'kamal', ">= 2.0.0.rc2", require: false
gem 'thruster', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'brakeman', require: false
  gem 'rspec-rails', '~> 7.0.0'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
