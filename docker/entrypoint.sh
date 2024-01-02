#!/bin/bash
bundle install
rails db:migrate
rails db:seed
yarn install
gem install overcommit
overcommit --install
overcommit --sign
exec "$@"
