# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
url_serialized = open(url).read
ingredients_hash = JSON.parse(url_serialized)

puts "Creating Ingredients."

5.times do 
    ingredient = Ingredient.create(name: "#{ingredients_hash["drinks"][rand(0..ingredients_hash["drinks"].length)]["strIngredient1"]}")
end


puts "Done."