source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3'
gem 'pg'

# Angular and related:
gem 'angularjs-rails'
gem 'underscore-rails'
gem "jasmine", github: "pivotal/jasmine-gem"

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# gem 'rails_admin', '~> 0.6.5'

# Use Zurb Foundation
gem 'foundation-rails'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks

gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development



# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'guard'
  gem 'pry'
end

group :staging do
  gem 'thin'
end

group :test do
  gem 'rspec-rails', '~> 3.0.0'
  gem 'jasmine-headless-webkit'
  gem 'guard-jasmine'
  gem 'guard-jasmine-headless-webkit'
  gem 'guard-rspec', require: false
  gem 'database_cleaner'
  gem 'simplecov', '~> 0.9.0', :require => false
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'guard-livereload', '~> 2.1.1', require: false
  gem 'rack-livereload'
  gem 'better_errors'
  gem 'binding_of_caller'
end

