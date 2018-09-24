# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Basically, the app allows people to rent electric cars.

Models

  User
    -name
    -email
    -password/password_digest
    -admin

  Ride or Appointment
    -start_date-time
    -end_date_time
    -user_id
    -car_id

  Car - first would be the car and then you could keep adding stuff
    -manufacturer
    -model
    -top speed
    -range
    -charge_time
    -price per day

  2. Validations to create different usernames
  3. Create admins
  4. Create and plan out routes
    - where should the nested routes go?
    - there's users, bookings and cars ... in rails amusement park there were no nested routes
  5. Need to create a sessions controller.
  6. Create the rails Authentication.
  7. Views
  8. Create seed data - look up different cars and specifics
