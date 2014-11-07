require 'faker'

# create a few users
User.create :name => 'Dev Bootcamp Student', :email => 'me@example.com', :password => 'password'
5.times do
  User.create :name => Faker::Name.name, :email => Faker::Internet.email, :password => 'password'
end

# create a few urban destinations
urban_destinations = ['Berlin', 'Rio de Janeiro', 'Nairobi', 'London', 'Mexico City', 'Tokyo']
urban_destinations.each do |destination|
  Destination.create :name => destination, :setting => 'urban'
end

# create a few rural destinations
rural_destinations = ['Yosemite', 'Great Barrier Reef', 'Antarctica', 'The Amazon', 'Himalayas']
rural_destinations.each do |destination|
  Destination.create :name => destination, :setting => 'rural'
end

# TODO: create associations between users and destinations
