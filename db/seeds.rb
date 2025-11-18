# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Creating Users..."

user_one = User.find_or_create_by!(email: "test@test.com") do |user|
    user.password = "test2025"
    user.password_confirmation = "test2025"
end

user_two = User.find_or_create_by!(email: "test2@test.com") do |user|
    user.password = "test2026"
    user.password_confirmation = "test2026"
end

puts "Created #{User.count} Users."

puts "Creating Recipes..."

Recipe.create!([
  {
    name: "Quinoa & Black Bean Salad",
    description: "A simple, low-GI salad using complex carbs and fresh vegetables.",
    steps: "1. Cook quinoa. 2. Rinse black beans. 3. Chop bell pepper and cilantro. 4. Mix all ingredients with lime juice and a dash of olive oil.",
    difficulty: 1,
    indice_gly: 35,
    ratio_glucide: 18,
    user_id: user_one.id
  },
  {
    name: "Homemade Chicken Curry",
    description: "A rich and flavorful curry, designed to be served with a small amount of brown rice or cauli-rice for a moderate GI.",
    steps: "1. Chop chicken and vegetables. 2. Sauté onions and garlic. 3. Add curry paste and spices. 4. Simmer chicken and veggies in coconut milk until cooked through.",
    difficulty: 2,
    indice_gly: 52,
    ratio_glucide: 12,
    user_id: user_one.id
  },
  {
    name: "Whole Wheat Banana Bread",
    description: "A modified banana bread recipe using whole wheat flour and natural sweeteners for a slightly lower GI than standard recipes.",
    steps: "1. Mash bananas. 2. Cream butter, sugar, and eggs. 3. Mix in dry ingredients (whole wheat flour, baking soda). 4. Bake for 50 minutes.",
    difficulty: 3,
    indice_gly: 59,
    ratio_glucide: 40,
    user_id: user_two.id
  }
])

puts "Created #{Recipe.count} Recipes."

puts "Creating Items"

Item.create!([
  {
    name: "Whole Wheat Bread",
    brand: "Boulangerie Artisanale",
    category: "Bakery",
    indice_gly: 69,
    ratio_glucide: 45,
    user_id: user_one.id
  },
  {
    name: "Oats (Rolled)",
    brand: "Quaker",
    category: "Cereal",
    indice_gly: 55,
    ratio_glucide: 66,
    user_id: user_one.id
  },
  {
    name: "Apple",
    brand: "N/A",
    category: "Fruit",
    indice_gly: 36,
    ratio_glucide: 14,
    user_id: user_one.id
  },
  {
    name: "White Rice",
    brand: "Uncle Ben's",
    category: "Grain",
    indice_gly: 73,
    ratio_glucide: 28,
    user_id: user_two.id
  },
  {
    name: "Lentils (Brown)",
    brand: "Generic",
    category: "Legume",
    indice_gly: 32,
    ratio_glucide: 11,
    user_id: user_two.id
  }
])

puts "Created #{Item.count} items."
