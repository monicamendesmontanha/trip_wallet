# Project #1: Trip Wallet

This is my first project mobile using Ruby on Rails and PostgreSQL.
[Link to live site](https://trip-wallet.herokuapp.com) Project 1: "Trip Wallet"



### Initial page showing a list with all trips
<img width="429" alt="Screen Shot 2019-04-25 at 22 08 49" src="https://user-images.githubusercontent.com/33978352/56734860-51bc3900-67a7-11e9-892b-2128c7c4290b.png">

### Form to add a new trip
<img width="428" alt="Screen Shot 2019-04-25 at 22 09 11" src="https://user-images.githubusercontent.com/33978352/56734862-51bc3900-67a7-11e9-8fbc-bb78f7e07563.png">

### Summary Trip
<img width="431" alt="Screen Shot 2019-04-25 at 22 07 24" src="https://user-images.githubusercontent.com/33978352/56734853-508b0c00-67a7-11e9-8007-c1f9c022812f.png">

### Add expense page
<img width="435" alt="Screen Shot 2019-04-25 at 22 07 49" src="https://user-images.githubusercontent.com/33978352/56734855-5123a280-67a7-11e9-83a9-ff22e1c6692c.png">

### History showing a list with all expenses
<img width="430" alt="Screen Shot 2019-04-25 at 22 08 12" src="https://user-images.githubusercontent.com/33978352/56734857-5123a280-67a7-11e9-8f2a-b133e3e8d173.png">

### Chart showing how much have been spending in each category
<img width="428" alt="Screen Shot 2019-04-25 at 22 08 27" src="https://user-images.githubusercontent.com/33978352/56734858-5123a280-67a7-11e9-85ce-0cd367f275be.png">



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

