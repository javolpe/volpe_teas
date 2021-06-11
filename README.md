# Volpe_teas

This is a mock backend for a tea subscription service where customers can order various tea subscriptions.  The application is built with Ruby and Ruby on Rails.  The backend receives and returns request as an API using JSON format. All information is stored and persisted in a PostgreSQL database.


The API endpoints allow customers to create a subsription for themselves to receive a tea subscription, toggle their own subscription on or off, and see all of their subscriptions, both active and cancelled.



### Created by:
- [Jake Volpe](https://github.com/javolpe) | [LinkedIn](https://www.linkedin.com/in/jake-volpe-bb602b126/)

#### Built With
* [Ruby on Rails](https://rubyonrails.org)


This project was tested with:
* RSpec version 3.10
* [Postman](https://www.postman.com/) Explore and test the API endpoints using Postman, and use Postman’s CLI to execute collections directly from the command-line.

## Contents
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installing](#installing)
- [Endpoints](#endpoints)  
- [Database Schema](#database-schema)  
- [Testing](#testing)




### Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system. Endpoints can be added. 

#### Prerequisites

* __Ruby__

  - The project is built with rubyonrails using __ruby version 2.5.3p105__, you must install ruby on your local machine first. Please visit the [ruby](https://www.ruby-lang.org/en/documentation/installation/) home page to get set up. _Please ensure you install the version of ruby noted above._

* __Rails__
  ```sh
  gem install rails --version 5.2.5
  ```

* __Postgres database__
  - Visit the [postgresapp](https://postgresapp.com/downloads.html) homepage and follow their instructions to download the latest version of Postgres app.

#### Frontend dependancies

#### Installing

1. Clone the repo
  ```
  $ git clone https://github.com/javolpe/volpe_teas
  ```

2. Bundle Install
  ```
  $ bundle install
  ```

3. Create, migrate and seed rails database
  ```
  $ rails db:{create,migrate,seed}
  ```



### Endpoints
| HTTP verbs | Paths  | Used for |
| ---------- | ------ | --------:|
| Post | /api/v1/customers/:customer_id/customer_subscriptions | Create a custome_subscription for a specific customer. |
| GET | /api/v1/customers/:customer_id/customer_subscriptions  | Get all the customer_subscriptions a specific customer. |
| PATCH | /api/v1/customers/:customer_id/customer_subscriptions/:id | Update the status of a specific customer_subscription. |





### Database Schema

[volpe_teas](https://ibb.co/SJKk0Qj)



### Testing
##### Running Tests
- To run the full test suite run the below in your terminal:
```
$ bundle exec rspec
```
- To run an individual test file run the below in tour terminal:
```
$ bundle exec rspec <file path>
```
for example: `bundle exec rspec spec/requests/api/vi/customer_subscriptions/patch_spec.rb`


