# Project #1: Trip Wallet

This is my first project mobile using **Ruby on Rails** and PostgreSQL. </br>
[Link to live site](https://trip-wallet.herokuapp.com) Project 1: "Trip Wallet"

- [x] [Feedback notes by @andthomas](https://gist.github.com/andthomas/99ac1a7058a39c0a93ad36110c54cdf6)

---
Keep track of your expenses while travelling.
Enjoy travelling and saving money at the same time.
Store and visualise all your expenses organized by category.

More features coming soon:
- Automatically conversion rates by tailored settings;


### Usage
![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/33978352/59548203-edd81480-8f8e-11e9-8725-3557ef38e0cc.gif)


### Listing trips
<img width="429" alt="Screen Shot 2019-04-25 at 22 08 49" src="https://user-images.githubusercontent.com/33978352/56734860-51bc3900-67a7-11e9-892b-2128c7c4290b.png">

### Adding a new trip
<img width="428" alt="Screen Shot 2019-04-25 at 22 09 11" src="https://user-images.githubusercontent.com/33978352/56734862-51bc3900-67a7-11e9-8fbc-bb78f7e07563.png">

### Summary of the trip
<img width="431" alt="Screen Shot 2019-04-25 at 22 07 24" src="https://user-images.githubusercontent.com/33978352/56734853-508b0c00-67a7-11e9-8007-c1f9c022812f.png">

### Adding expense
<img width="435" alt="Screen Shot 2019-04-25 at 22 07 49" src="https://user-images.githubusercontent.com/33978352/56734855-5123a280-67a7-11e9-83a9-ff22e1c6692c.png">

### History of all expenses
<img width="430" alt="Screen Shot 2019-04-25 at 22 08 12" src="https://user-images.githubusercontent.com/33978352/56734857-5123a280-67a7-11e9-8f2a-b133e3e8d173.png">

### Expenses by category
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

