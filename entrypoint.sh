#!/bin/bash

gem install bundler -v 2.2.16

bundle update

set -e

# If the database exists, migrate. Otherwise setup (create and migrate)
rails db:create db:migrate
echo "MySQL database has been created & migrated!"

# Remove a potentially pre-existing server.pid for Rails.
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# Run the Rails server
bundle exec rails server -b 0.0.0.0 -p 3030