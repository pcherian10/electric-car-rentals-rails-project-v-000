# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Paul Cherian", email: "paul.cherian@gmail.com", password: "password" )
User.create(name: "Melissa Rubes", email: "melissa.rubes@gmail.com", password: "password" )
User.create(name: "Kaleo Elam", email: "kaleo.elam@gmail.com", password: "password" )


Car.create(name:"BMW Brilliance Zinoro 1E", top_speed: 130, range: 150, charge_time: 4, price_per_day: 150)
Car.create(name:"Tesla Model X", top_speed: 210, range: 350, charge_time: 8, price_per_day: 200)
Car.create(name:"Tesla Model S", top_speed: 210, range: 320, charge_time: 8, price_per_day: 215)
Car.create(name:"Tesla Model 3", top_speed: 210, range: 350, charge_time: 7, price_per_day: 195)

=begin

:user_keys =>
  ["name", "email", "password"],
:users => [
  ["Paul Cherian", "paul.cherian@gmail.com", "password"],
  ["Melissa Rubes", "melissa.rubes@gmail.com", "password"],
  ["Kaleo Elam", "kaleo.elam@gmail.com" "password"],
  ["Megan Charpentier", "megan.carpentier@gmail.com", "password"],
  ["Hayden Byerly", "hayden.byerly@gmail.com", "password"],
  ["Tenzing Norgay Trainor", "tenzing.norgay@gmail.com", "password"],
],

:car_keys =>
 ["manufacturer", "model", "top_speed", "range", "charge_time", "price_per_day"],
:cars => [
  ["BMW", "i3", 150, 183, 4, 150],
  ["BMW Brilliance", "Zinoro 1E", 130, 150, 4, 150],
  ["Mercedes Benz", "B-Class Electric", 160, 200, 7, 175],
  ["Nissan", "Leaf", 150, 200, 15, 105],
  ["Tesla", "Model S", 210, 320, 8, 200],
  ["Tesla", "Model X", 210, 350, 8, 215],
  ["Tesla", "Model 3", 210, 350, 7, 195],
],


DATA = {
  :user_keys =>
    ["name", "nausea", "happiness", "tickets", "height", "password"],
  :users => [
    ["Max Charles", 0, 3, 6, 32, "password"],
    ["Skai Jackson", 1, 3, 10, 60, "password"],
    ["Kaleo Elam", 1, 2, 15, 59, "password"],
    ["Megan Charpentier", 3, 1, 12, 60, "password"],
    ["Hayden Byerly", 1, 1, 16, 58, "password"],
    ["Tenzing Norgay Trainor", 0, 1, 10, 55, "password"],
    ["Davis Cleveland", 1, 3, 5, 36, "password"],
    ["Cole Sand", 2, 2, 7, 34, "password"],
    ["Quvenzhané Wallis", 2, 2, 13, 30, "password"]
  ],
  :attraction_keys =>
   ["name", "nausea_rating", "happiness_rating", "tickets", "min_height"],
  :attractions => [
    ["Scrambler Ride", 2, 2, 2, 36],
    ["Miniature Railroad", 0, 1, 2, 32],
    ["Merry-Go-Round", 1, 1, 1, 30],
    ["Roller Coaster", 1, 3, 4, 54],
    ["Swinging Ship", 2, 2, 2, 36],
    ["Go Karts", 1, 2, 3, 36],
    ["Haunted Mansion", 1, 1, 1, 30],
    ["Ferris Wheel", 1, 1, 2, 36],
    ["Teacups Ride", 3, 1, 1, 28]
  ],
  :admins => [
    "Mary Elitch Long",
    "John Elitch"
  ]
}

def main
  make_users
  make_admin
  make_attractions_and_rides
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_admin
  DATA[:admins].each do |name|
    User.create(name: name, admin: true, password: 'password')
  end
end

def make_attractions_and_rides
  DATA[:attractions].each do |attraction|
    new_attraction = Attraction.new
    attraction.each_with_index do |attribute, i|
      new_attraction.send(DATA[:attraction_keys][i] + "=", attribute)
    end
    rand(1..8).times do
      customers = []
      User.all.each {|u| customers << u if u.admin != true}
      new_attraction.users << customers[rand(0...customers.length)]
    end
    new_attraction.users.each {|c| c.save}
    new_attraction.save
  end
end

=end
