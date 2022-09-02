# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

#require 'faker'
#
#5.times do |meal|
#    Meal.create(account_id: 1, name: Faker::Food.dish, url: '#', picture_url: "https://images.unsplash.com/#photo-1604908176997-125f25cc6f3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&#w=2213&q=80")
#end

require 'uri'
require 'net/http'

url = URI('https://raw.githubusercontent.com/raywenderlich/recipes/master/Recipes.json')
response = Net::HTTP.get(url)
json_recipes = JSON.parse(response)

#Meal.create(account_id: 1, name: json_recipes[0]['name'], url: json_recipes[0]["originalURL"], picture_url: json_recipes[0]#["imageURL"])

#Create all the meals
json_recipes.each do |recipe|
    puts recipe
   if recipe["originalURL"].present?
      Meal.create!(account_id: 1, name: recipe['name'], url: recipe["originalURL"], picture_url: recipe["imageURL"])
   end
end

Packing.create(name: "school", profile: Profile.first, item1: "pen", item2: "pencil", item3: "paper")
