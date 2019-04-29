# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.1'
gem 'rails', '5.1'
gem 'pg', '~> 0.18.4'
gem 'rack'
gem 'sass-rails'
gem 'haml_coffee_assets'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jbuilder'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'
gem 'devise'
gem 'devise-i18n'
gem 'i18n-js'
gem 'awesome_print'
gem 'paper_trail'
gem 'business_time'
gem 'holidays'
gem 'sentry-raven'
gem 'bootstrap-sass'
gem 'jira-ruby', require: false
gem 'interactor'
gem 'pry-rails'
gem 'kaminari'
gem 'sidekiq'
gem 'sidekiq-status'
gem 'sinatra', require: false
gem 'immigrant'
gem 'validates_overlap'
gem 'net-ldap'
gem 'haml'
gem 'redis-namespace'
gem 'dotenv-rails'
gem 'jwt', require: false
gem 'webpacker'
gem 'react-rails'
gem 'rails-ujs'
gem 'pundit'

source 'https://rails-assets.org' do
  gem 'rails-assets-marionette', '2.4.4'
  gem 'rails-assets-backbone-query-parameters'
  gem 'rails-assets-momentjs'
  gem 'rails-assets-backbone.stickit'
  gem 'rails-assets-bootstrap', '3.3.6'
  gem 'rails-assets-jquery-cookie'
  gem 'rails-assets-jquery.maskedinput'
  gem 'rails-assets-eonasdan-bootstrap-datetimepicker'
  gem 'rails-assets-lodash', '4.3.0'
  gem 'rails-assets-URIjs', '1.17.1'
  gem 'rails-assets-i18next'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rubocop'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  gem 'capistrano-rails'
  gem 'capistrano-sidekiq'
  gem 'capistrano-yarn'
  gem 'capistrano-nvm'
end

group :test do
  gem 'simplecov', require: false
  gem 'json_spec'
end

group :development, :test do
  gem 'puma'
  gem 'ffaker', require: false
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'capybara-selenium'
  gem 'chromedriver-helper'
end
