#!/bin/bash --login

export RUBY_VERSION="ruby-2.2.1"

rvm use "$RUBY_VERSION@horse-zone" --create

bundle exec rspec