#!/bin/bash --login

export RUBY_VERSION="ruby-2.2.2"

#rvm install $RUBY_VERSION
rvm use "$RUBY_VERSION@horse-zone" --create
gem update --system
gem install bundler
bundle install
bundle exec rake db:create
bundle exec rake db:schema:load


