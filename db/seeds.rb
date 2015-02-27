# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

15.times do |i|
  Product.create(
    name: "Product ##{i}", 
    description: "A product.",
    price: 10.0,
    image_link: "https://s3-ap-southeast-1.amazonaws.com/s3fileslive/public/gallery/40825_food_pizza_1477172.jpeg")
end