# Project #1: Trip Wallet

This is my first project using Ruby on Rails and PostgreSQL. </br>

### Running locally

Requirements:

* Ruby 2.6.*
* Postgresql

1. Make sure postgresql is up and running

```sh
$ brew install postgresql
$ brew service start postgresql
```

2. Install the dependencies

```sh
$ bundle install
```

3. Setup the database

```sh
$ bundle exec rake db:setup
```

4. Start the server

```sh
$ bundle exec rails server
```

