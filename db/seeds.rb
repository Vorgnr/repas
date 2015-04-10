# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(customer delivery_man).each do |role|
  Role.find_or_create_by({name: role})
end
[
  {:email => 'customer@gmail.com', :password => 'password', :password_confirmation => 'password', :role_id => 1},
  {:email => 'delivery@gmail.com', :password => 'password', :password_confirmation => 'password', :role_id => 2}
].each do |user|
  User.create(user)
end

15.times do |i|
  Product.create(
    name: "Product ##{i}", 
    description: 'A product.',
    price: 10.0,
    image_link: 'https://s3-ap-southeast-1.amazonaws.com/s3fileslive/public/gallery/40825_food_pizza_1477172.jpeg'
  )
end

%w(is_new is_paid is_delivered is_cashed).each do |status|
  Status.find_or_create_by({label: status})
end
