#!/bin/bash --login

export RUBY_VERSION="ruby-2.2.3"

#rvm install $RUBY_VERSION
rvm use "$RUBY_VERSION@horse-zone" --create
gem update --system
gem install bundler
gem install nokogiri -v '1.6.6.2'
bundle install
bundle exec rake db:create
bundle exec rake db:schema:load


