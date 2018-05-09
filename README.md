Rails on Docker
===

## Usage

#### Launch New Project

Execute following commands:
```
>> docker-compose run web rails new . --force --database=postgresql
>> sudo chown -R $USER .
>> docker-compose build
>> docker-compose up
>> docker-compose run web rails db:create
```

And Replace the contents of config/database.yml with the followings:
```
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
```

#### Resume Develop

```
docker-compose up -d
```

or

```
docker-compose up --build -d
```


## License
Copyright © 2018 Docker Inc. All rights reserved.

## Reference
https://docs.docker.com/compose/rails/
