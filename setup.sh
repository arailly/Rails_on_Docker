#!/bin/bash

docker-compose run web rails new . --force --database=postgresql
sudo chown -R $USER .

cat <<EOF> ./config/database.yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: db
  username: postgres
  password:
  pool: 5

development:
  <<: *default
  database: myapp_development


test:
  <<: *default
  database: myapp_test
EOF

docker-compose build
docker-compose up
docker-compose run web rails db:create
