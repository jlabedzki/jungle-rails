# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Purpose

BEWARE: This application was built as a part of my studies at Lighthouse Labs and is NOT intended as production grade software.

The purpose of this project was to simulate what it's like to inherit a codebase in an unfamiliar language. We learned Ruby on Rails at an accelerated pace to be able to add features and fix bugs on the existing codebase. As such, not all features are fully completed.

## Features
Visitors can:
- Browse the catalog of products
- Read details on an individual product
- Add items to their cart
- Place an order

Logged in users can (in addition to visitor features):
- Leave a review on a product
- Delete any reviews they've made

Admins can:
- Create product categories
- Create or delete a product
- Visit a dashboard which displays the number of products and categories

## Final Product

!["Homepage"](https://github.com/jlabedzki/jungle-rails/blob/master/screenshots/Screen%20Shot%202021-10-20%20at%2011.17.59%20AM.png?raw=true)
!["Cart"](https://github.com/jlabedzki/jungle-rails/blob/master/screenshots/Screen%20Shot%202021-10-20%20at%2011.18.20%20AM.png?raw=true)
!["Successful order"](https://github.com/jlabedzki/jungle-rails/blob/master/screenshots/Screen%20Shot%202021-10-20%20at%2011.18.41%20AM.png?raw=true)
!["Admin products"](https://github.com/jlabedzki/jungle-rails/blob/master/screenshots/Screen%20Shot%202021-10-20%20at%2011.18.53%20AM.png?raw=true)
!["Admin categories"](https://github.com/jlabedzki/jungle-rails/blob/master/screenshots/Screen%20Shot%202021-10-20%20at%2011.19.02%20AM.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
