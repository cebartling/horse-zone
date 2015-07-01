source 'https://rubygems.org'

# ruby '1.9.3', :engine => 'jruby', :engine_version => '1.7.18'
ruby '2.2.2'

gem 'rails', '4.2.3'

# gem 'activerecord-jdbcpostgresql-adapter'
# gem 'jruby-openssl', '0.9.5'       # This should be fixed at some point on CodeShip

gem 'pg'

gem 'yajl-ruby', require: 'yajl'
gem 'nokogiri'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyrhino'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'puma'
gem 'rabl'
gem 'use_case'
gem 'will_paginate'
gem 'virtus'
gem 'annotate'
gem 'uuidtools'
gem 'rollbar'
gem 'icalendar'
gem 'responders'
gem 'jwt'
# gem 'rack-cors'
gem 'delayed_job_active_record'
gem 'bcrypt'
gem 'stripe'
gem 'capistrano'
gem 'swagger-blocks'
gem "newrelic_rpm"
gem 'rubocop', require: false
gem 'rubocop-rspec'
# gem 'memcachier'
# gem 'dalli'
gem "chronic"
gem "recurrence"
gem 'premailer-rails'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'timecop'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

group :development do
  gem 'quiet_assets'
  gem 'spring'
  gem 'bullet'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', require: false
end

group :production, :demo do
  gem 'rails_12factor'
  gem 'heroku-deflater'
end

# gem "premailer-rails"

# gem "aws-sdk"

# gem "html-pipeline"
# gem "rinku"

# gem 'doc_raptor'
# gem "active_model_serializers"
# gem "rubyzip"
# gem "render_anywhere", require: false
# gem "pusher"
# gem 'filepicker-rails'
# gem "intercom-rails"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
