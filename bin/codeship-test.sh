#!/bin/bash --login

export RUBY_VERSION="ruby-2.2.3"
rvm use "$RUBY_VERSION@horse-zone" --create
bundle exec rspec