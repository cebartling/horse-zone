#!/bin/bash --login

export RUBY_VERSION="ruby-2.2.0"

#rvm install $RUBY_VERSION
rvm use "$RUBY_VERSION@horse-zone" --create
bundle install
bundle exec rake db:create
bundle exec rake db:schema:load


