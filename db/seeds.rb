require "open-uri"

puts "Destroying all data..."
Post.destroy_all
Recipe.destroy_all
Item.destroy_all
User.destroy_all

puts "Creating Users..."

# Existing Users (4 Total)
user_one = User.find_or_create_by!(email: "martin@gmail.com") do |user|
    user.password = "test2025"
    user.password_confirmation = "test2025"
    user.profile_name = "Martin Abdelkader"
end

user_two = User.find_or_create_by!(email: "DJ.amil@hotmail.com") do |user|
    user.password = "test2026"
    user.password_confirmation = "test2026"
    user.profile_name = "Wassim de Richelieu"
end

# 2 New Users (Total now 4)
user_three = User.find_or_create_by!(email: "thib@gmail.com") do |user|
    user.password = "test2027"
    user.password_confirmation = "test2027"
    user.profile_name = "Thibault De Grand-Rien"
end

user_four = User.find_or_create_by!(email: "tim@gmail.com") do |user|
    user.password = "test2028"
    user.password_confirmation = "test2028"
    user.profile_name = "Tim Régis de Villette"
end

puts "Created #{User.count} Users."

# --- RECIPES (15 additional) ---
puts "Creating Recipes..."

Recipe.create!([
  # Original 3
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
    user_id: user_one.id
  },
  # 15 Additional Recipes
  {
    name: "Low-GI Berry Smoothie",
    description: "A quick breakfast using high-fiber berries and Greek yogurt.",
    steps: "1. Blend mixed berries, spinach, water, and Greek yogurt until smooth.",
    difficulty: 1,
    indice_gly: 30,
    ratio_glucide: 15,
    user_id: user_three.id
  },
  {
    name: "Lentil Shepherd's Pie (Cauliflower Topping)",
    description: "A hearty vegetarian option with a low-carb topping.",
    steps: "1. Cook lentils with vegetables (carrots, celery). 2. Steam and mash cauliflower. 3. Top lentil mix with cauliflower mash and bake.",
    difficulty: 3,
    indice_gly: 42,
    ratio_glucide: 10,
    user_id: user_four.id
  },
  {
    name: "Oatmeal with Nuts and Seeds",
    description: "Classic high-fiber breakfast, slowed release with healthy fats.",
    steps: "1. Cook rolled oats with water or milk. 2. Stir in mixed nuts, chia seeds, and a pinch of cinnamon.",
    difficulty: 1,
    indice_gly: 55,
    ratio_glucide: 60,
    user_id: user_one.id
  },
  {
    name: "Zucchini Noodles with Pesto & Shrimp",
    description: "A very low GI, high-protein pasta alternative.",
    steps: "1. Spiralize zucchini. 2. Sauté shrimp. 3. Toss 'zoodles' with pesto and shrimp.",
    difficulty: 2,
    indice_gly: 20,
    ratio_glucide: 5,
    user_id: user_two.id
  },
  {
    name: "Buckwheat Pancakes",
    description: "Gluten-free pancakes with a lower GI than standard wheat flour.",
    steps: "1. Mix buckwheat flour, egg, baking powder, and milk. 2. Cook on a griddle. 3. Serve with berries and plain yogurt.",
    difficulty: 2,
    indice_gly: 50,
    ratio_glucide: 48,
    user_id: user_three.id
  },
  {
    name: "Chicken and Vegetable Stir-fry",
    description: "Quick, customizable meal focusing on high-fiber vegetables.",
    steps: "1. Chop chicken and vegetables. 2. Stir-fry chicken. 3. Add vegetables and a light soy sauce/ginger dressing.",
    difficulty: 1,
    indice_gly: 38,
    ratio_glucide: 8,
    user_id: user_four.id
  },
  {
    name: "Spelt Flour Pizza Base",
    description: "A yeast-based base using spelt, a grain with a slightly lower GI than standard wheat.",
    steps: "1. Mix spelt flour, water, yeast, and salt. 2. Knead and let rise. 3. Roll out and bake with toppings.",
    difficulty: 4,
    indice_gly: 65,
    ratio_glucide: 55,
    user_id: user_one.id
  },
  {
    name: "Avocado & Egg Toast (Rye Bread)",
    description: "Protein and healthy fats on low-GI rye bread.",
    steps: "1. Toast rye bread. 2. Mash avocado and season. 3. Fry egg. 4. Assemble toast.",
    difficulty: 1,
    indice_gly: 45,
    ratio_glucide: 22,
    user_id: user_two.id
  },
  {
    name: "Black Bean Burgers",
    description: "Homemade vegetarian burgers, focusing on legumes for fiber.",
    steps: "1. Mash black beans. 2. Mix with breadcrumbs, spices, and egg. 3. Form patties and bake or fry.",
    difficulty: 3,
    indice_gly: 38,
    ratio_glucide: 30,
    user_id: user_three.id
  },
  {
    name: "Tuna Salad Lettuce Wraps",
    description: "Extremely low-carb, high-protein lunch.",
    steps: "1. Mix tuna, mayonnaise/yogurt, celery, and herbs. 2. Spoon mixture into large lettuce leaves.",
    difficulty: 1,
    indice_gly: 15,
    ratio_glucide: 2,
    user_id: user_four.id
  },
  {
    name: "Homemade Hummus",
    description: "A nutritious spread made from chickpeas (low GI).",
    steps: "1. Blend chickpeas, tahini, lemon juice, garlic, and water until smooth.",
    difficulty: 2,
    indice_gly: 28,
    ratio_glucide: 25,
    user_id: user_one.id
  },
  {
    name: "Brown Rice Pudding (Stevia)",
    description: "A dessert using brown rice and a non-sugar sweetener.",
    steps: "1. Cook brown rice with milk, stevia, and vanilla. 2. Simmer until creamy.",
    difficulty: 3,
    indice_gly: 50,
    ratio_glucide: 35,
    user_id: user_two.id
  },
  {
    name: "Whole Grain Pasta with Marinara",
    description: "Standard dish using whole grain pasta for better GI control.",
    steps: "1. Cook whole grain pasta al dente. 2. Heat marinara sauce. 3. Combine and serve with Parmesan.",
    difficulty: 1,
    indice_gly: 45,
    ratio_glucide: 32,
    user_id: user_three.id
  },
  {
    name: "Roasted Chickpeas",
    description: "Crunchy, high-protein, low-GI snack.",
    steps: "1. Rinse and dry chickpeas. 2. Toss with olive oil and spices. 3. Roast until crispy.",
    difficulty: 2,
    indice_gly: 35,
    ratio_glucide: 20,
    user_id: user_four.id
  },
  {
    name: "Turkey Meatballs with Spinach",
    description: "Lean protein meal, served with greens.",
    steps: "1. Mix ground turkey, egg, breadcrumbs, and spices. 2. Roll into balls and bake. 3. Serve over lightly sautéed spinach.",
    difficulty: 2,
    indice_gly: 18,
    ratio_glucide: 5,
    user_id: user_one.id
  },
  # High GI Recipes (IG > 70)
  {
    name: "Classic French Baguette",
    description: "Traditional crusty French bread with a high glycemic index - best enjoyed in moderation.",
    steps: "1. Mix flour, water, yeast, and salt. 2. Knead for 10 minutes. 3. Let rise for 2 hours. 4. Shape into baguettes. 5. Score the top and bake at 230°C for 25 minutes.",
    difficulty: 3,
    indice_gly: 95,
    ratio_glucide: 56,
    user_id: user_one.id
  },
  {
    name: "Creamy Mashed Potatoes",
    description: "Rich and buttery mashed potatoes - a comfort food classic with high GI.",
    steps: "1. Peel and cube potatoes. 2. Boil until tender. 3. Drain and mash with butter. 4. Add warm milk and cream. 5. Season with salt and pepper.",
    difficulty: 1,
    indice_gly: 83,
    ratio_glucide: 17,
    user_id: user_one.id
  },
  {
    name: "Jasmine Rice Bowl",
    description: "Fragrant jasmine rice served with stir-fried vegetables - delicious but high on the glycemic scale.",
    steps: "1. Rinse jasmine rice. 2. Cook with water in rice cooker. 3. Stir-fry vegetables with soy sauce. 4. Serve vegetables over fluffy rice. 5. Garnish with sesame seeds.",
    difficulty: 1,
    indice_gly: 89,
    ratio_glucide: 28,
    user_id: user_one.id
  },
  {
    name: "Crispy Rice Krispies Treats",
    description: "Sweet and crunchy marshmallow treats - a nostalgic dessert with very high GI.",
    steps: "1. Melt butter in a large pot. 2. Add marshmallows and stir until melted. 3. Remove from heat and add Rice Krispies. 4. Press into a greased pan. 5. Let cool and cut into squares.",
    difficulty: 1,
    indice_gly: 82,
    ratio_glucide: 78,
    user_id: user_one.id
  },
  {
    name: "Watermelon Sorbet",
    description: "Refreshing summer dessert made with fresh watermelon - naturally high GI fruit.",
    steps: "1. Cube seedless watermelon. 2. Freeze for 2 hours. 3. Blend frozen watermelon with lime juice and honey. 4. Freeze for another hour. 5. Serve with fresh mint.",
    difficulty: 2,
    indice_gly: 72,
    ratio_glucide: 8,
    user_id: user_one.id
  }
])

puts "Created #{Recipe.count} Recipes."

# --- ATTACH PHOTOS TO RECIPES ---
puts "Attaching photos to Recipes..."

# Helper method to attach photo from URL
def attach_photo(record, url)
  return if url.blank?
  file = URI.open(url)
  record.photo.attach(io: file, filename: "#{record.name.parameterize}.jpg", content_type: "image/jpeg")
  puts "  ✓ Attached photo to: #{record.name}"
rescue => e
  puts "  ✗ Failed to attach photo to #{record.name}: #{e.message}"
end

# Recipe photos - Fill in your Cloudinary URLs below
recipe_photos = {
  "Quinoa & Black Bean Salad" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163199/quinoa_vhkens.jpg",
  "Homemade Chicken Curry" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163189/chicken_curry_fciwrl.jpg",
  "Whole Wheat Banana Bread" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163189/banana_bread_gkyfjq.jpg",
  "Low-GI Berry Smoothie" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163190/berry_smoothie_z2cabb.jpg",
  "Lentil Shepherd's Pie (Cauliflower Topping)" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163188/lentil_pie_dmq61i.jpg",
  "Oatmeal with Nuts and Seeds" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163194/oatmeal_zyjqnk.jpg",
  "Zucchini Noodles with Pesto & Shrimp" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163203/zucchini_noodles_amcqql.jpg",
  "Buckwheat Pancakes" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163209/pancackes_jkiea3.jpg",
  "Chicken and Vegetable Stir-fry" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163209/Chicken_and_Vegetable_Stir-fry_msxppz.jpg",
  "Spelt Flour Pizza Base" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163208/Spelt_Flour_Pizza_Base_kr22lp.jpg",
  "Avocado & Egg Toast (Rye Bread)" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163208/Avocado_Egg_Toast_Rye_Bread_y2m30e.jpg",
  "Black Bean Burgers" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163198/Black_Bean_Burgers_melb9t.jpg",
  "Tuna Salad Lettuce Wraps" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163202/Tuna_Salad_Lettuce_Wraps_pci64i.jpg",
  "Homemade Hummus" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163200/homemade_hummus_apzjfk.jpg",
  "Brown Rice Pudding (Stevia)" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163195/Brown_Rice_Pudding_Stevia_k2z7a2.jpg",
  "Whole Grain Pasta with Marinara" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163195/Whole_Grain_Pasta_with_Marinara_h7bum4.jpg",
  "Roasted Chickpeas" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163197/Roasted_Chickpeas_rkxngs.jpg",
  "Turkey Meatballs with Spinach" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764163199/Turkey_Meatballs_with_Spinach_uwdcew.jpg",
  "Classic French Baguette" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764165839/franck-tourneret-q-_KXOY9JG8-unsplash_k3f6zt.jpg",
  "Creamy Mashed Potatoes" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764165677/puree_wydkkw.jpg",
  "Jasmine Rice Bowl" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764165678/rizjasmin_vduzai.jpg",
  "Crispy Rice Krispies Treats" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764165679/Crispy_Rice_Krispies_Treats_jap4w3.jpg",
  "Watermelon Sorbet" => "https://res.cloudinary.com/dvoeovqth/image/upload/v1764165679/Watermelon_Sorbet_xhlka6.jpg"
}

recipe_photos.each do |name, url|
  recipe = Recipe.find_by(name: name)
  attach_photo(recipe, url) if recipe && url.present?
end

puts "Done attaching recipe photos."

# --- ITEMS (15 additional) ---
puts "Creating Items"

Item.create!([
  # Original 5
  {
    name: "Whole Wheat Bread",
    brand: "Boulangerie Artisanale",
    category: "Grains & Legumes",
    indice_gly: 69,
    ratio_glucide: 45,
    user_id: user_one.id
  },
  {
    name: "Oats (Rolled)",
    brand: "Quaker",
    category: "Grains & Legumes",
    indice_gly: 55,
    ratio_glucide: 66,
    user_id: user_one.id
  },
  {
    name: "Apple",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 36,
    ratio_glucide: 14,
    user_id: user_one.id
  },
  {
    name: "White Rice",
    brand: "Uncle Ben's",
    category: "Grains & Legumes",
    indice_gly: 73,
    ratio_glucide: 28,
    user_id: user_one.id
  },
  {
    name: "Lentils (Brown)",
    brand: "Generic",
    category: "Grains & Legumes",
    indice_gly: 32,
    ratio_glucide: 11,
    user_id: user_one.id
  },
  # 15 Additional Items
  {
    name: "Brown Rice",
    brand: "Tilda",
    category: "Grains & Legumes",
    indice_gly: 50,
    ratio_glucide: 25,
    user_id: user_one.id
  },
  {
    name: "Sweet Potato",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 63,
    ratio_glucide: 20,
    user_id: user_one.id
  },
  {
    name: "Whole Grain Pasta (Spaghetti)",
    brand: "Barilla",
    category: "Grains & Legumes",
    indice_gly: 45,
    ratio_glucide: 30,
    user_id: user_one.id
  },
  {
    name: "Yogurt (Plain Greek)",
    brand: "Fage",
    category: "Dairy & Substitutes",
    indice_gly: 18,
    ratio_glucide: 4,
    user_id: user_one.id
  },
  {
    name: "Quinoa",
    brand: "Generic",
    category: "Grains & Legumes",
    indice_gly: 53,
    ratio_glucide: 21,
    user_id: user_one.id
  },
  {
    name: "Chickpeas (Canned)",
    brand: "Casbah",
    category: "Grains & Legumes",
    indice_gly: 33,
    ratio_glucide: 19,
    user_id: user_one.id
  },
  {
    name: "Watermelon",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 72, # High GI, but low GL
    ratio_glucide: 8,
    user_id: user_one.id
  },
  {
    name: "Rye Bread (Pumpernickel)",
    brand: "German Bakery",
    category: "Grains & Legumes",
    indice_gly: 55,
    ratio_glucide: 42,
    user_id: user_two.id
  },
  {
    name: "Carrots (Raw)",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 35,
    ratio_glucide: 7,
    user_id: user_three.id
  },
  {
    name: "Corn Flakes",
    brand: "Kellogg's",
    category: "Grains & Legumes",
    indice_gly: 81,
    ratio_glucide: 84,
    user_id: user_four.id
  },
  {
    name: "Milk (Skim)",
    brand: "Lactel",
    category: "Dairy & Substitutes",
    indice_gly: 32,
    ratio_glucide: 5,
    user_id: user_one.id
  },
  {
    name: "Table Sugar (Sucrose)",
    brand: "Generic",
    category: "Sweets & Sugars",
    indice_gly: 65,
    ratio_glucide: 100,
    user_id: user_two.id
  },
  {
    name: "Puffed Rice Cakes",
    brand: "Nature Valley",
    category: "Grains & Legumes",
    indice_gly: 82,
    ratio_glucide: 80,
    user_id: user_three.id
  },
  {
    name: "Orange",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 43,
    ratio_glucide: 12,
    user_id: user_four.id
  },
  {
    name: "Popcorn (Air-Popped)",
    brand: "N/A",
    category: "Grains & Legumes",
    indice_gly: 55,
    ratio_glucide: 78,
    user_id: user_one.id
  },
  # Sweets & Sugars (need 1 more)
  {
    name: "Dark Chocolate (70%)",
    brand: "Lindt",
    category: "Sweets & Sugars",
    indice_gly: 23,
    ratio_glucide: 33,
    user_id: user_one.id
  },
  # Meat & Substitutes
  {
    name: "Chicken Breast",
    brand: "N/A",
    category: "Meat & Substitutes",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_one.id
  },
  {
    name: "Tofu (Firm)",
    brand: "Sojasun",
    category: "Meat & Substitutes",
    indice_gly: 15,
    ratio_glucide: 2,
    user_id: user_one.id
  },
  # Fats & Oils
  {
    name: "Olive Oil (Extra Virgin)",
    brand: "Puget",
    category: "Fats & Oils",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_one.id
  },
  {
    name: "Almonds (Raw)",
    brand: "N/A",
    category: "Fats & Oils",
    indice_gly: 15,
    ratio_glucide: 9,
    user_id: user_four.id
  },
  # Water
  {
    name: "Mineral Water",
    brand: "Evian",
    category: "Water",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_one.id
  },
  {
    name: "Sparkling Water",
    brand: "Perrier",
    category: "Water",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_two.id
  },
  # Alcohol
  {
    name: "Red Wine",
    brand: "Bordeaux",
    category: "Alcohol",
    indice_gly: 0,
    ratio_glucide: 2,
    user_id: user_three.id
  },
  {
    name: "Beer (Lager)",
    brand: "Kronenbourg",
    category: "Alcohol",
    indice_gly: 66,
    ratio_glucide: 3,
    user_id: user_four.id
  },
  # Sugary Drinks
  {
    name: "Orange Juice",
    brand: "Tropicana",
    category: "Sugary Drinks",
    indice_gly: 50,
    ratio_glucide: 10,
    user_id: user_one.id
  },
  {
    name: "Cola",
    brand: "Coca-Cola",
    category: "Sugary Drinks",
    indice_gly: 63,
    ratio_glucide: 11,
    user_id: user_two.id
  },
  # Vitamins & Minerals
  {
    name: "Multivitamin Tablets",
    brand: "Centrum",
    category: "Vitamins & Minerals",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_three.id
  },
  {
    name: "Vitamin D Supplement",
    brand: "Nature Made",
    category: "Vitamins & Minerals",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_four.id
  }
])

puts "Created #{Item.count} items."

# --- POSTS (15 additional) ---
puts "Creating posts..."

# The original 4 posts are created using the existing code style
Post.create!(
    content: "Does someone has a CarboDuct with low glycemic index to share?! I'm desesperate",
    up: 45,
    down: 5,
    user: user_two,
    created_at: 1.day.ago
)

Post.create!(
    content: "I discovered an amazing recipe, sharing it with you all! Check out my Turkey Meatballs with Spinach in my profile!",
    up: 120,
    down: 3,
    user: user_one,
    created_at: 1.hour.ago
)

Post.create!(
    content: "Hidden sugar in foods. Let's discuss.",
    up: 15,
    down: 25,
    user: user_three,
    created_at: 5.hours.ago
)

Post.create!(
    content: "New Carrefour product available, has anyone tried it yet?",
    up: 8,
    down: 0,
    user: user_four,
    created_at: 10.hours.ago
)

# 15 Additional Posts
Post.create!([
    {
        content: "Does anyone have a good alternative to white rice for dinner? Looking for something with a low GI.",
        up: 35,
        down: 2,
        user: user_three,
        created_at: 3.hours.ago
    },
    {
        content: "Heads up for diabetics: be careful with 'no added sugar' fruit juices, the GI is still high!",
        up: 50,
        down: 1,
        user: user_four,
        created_at: 2.hours.ago
    },
    {
        content: "Testing rye bread today. The GI is better than standard whole wheat bread. Will keep you posted!",
        up: 22,
        down: 0,
        user: user_four,
        created_at: 1.hour.ago
    },
    {
        content: "Recipe of the day: Chickpea and feta salad. Simple, quick, and great GI. Posting it soon.",
        up: 78,
        down: 4,
        user: user_two,
        created_at: 45.minutes.ago
    },
    {
        content: "My blood sugar always spikes after breakfast. Any ideas for low GI morning snacks?",
        up: 10,
        down: 5,
        user: user_three,
        created_at: 30.minutes.ago
    },
    {
        content: "Exercise after meals really helps regulate blood sugar. Who else does this?",
        up: 60,
        down: 0,
        user: user_four,
        created_at: 20.hours.ago
    },
    {
        content: "Disappointed by gluten-free pasta. The taste isn't there. Any brands to recommend?",
        up: 5,
        down: 15,
        user: user_one,
        created_at: 10.hour.ago
    },
    {
        content: "Root vegetables (carrots, beets) raw have a much lower GI than cooked. Important info to know!",
        up: 90,
        down: 1,
        user: user_two,
        created_at: 10.hours.ago
    },
    {
        content: "Looking for dessert recipes with natural sweeteners (stevia, erythritol). Share your best tips!",
        up: 18,
        down: 0,
        user: user_three,
        created_at: 8.minutes.ago
    },
    {
        content: "The 'cheat meal' myth. Is it really beneficial or just an excuse to indulge?",
        up: 40,
        down: 30,
        user: user_four,
        created_at: 5.hours.ago
    },
    {
        content: "Intermittent fasting (IF) trend. What are your results on insulin sensitivity?",
        up: 150,
        down: 10,
        user: user_one,
        created_at: 2.hours.ago
    },
    {
        content: "Watch out for the glycemic index of popcorn. It spikes fast!",
        up: 5,
        down: 2,
        user: user_two,
        created_at: 59.hours.ago
    },
    {
        content: "It's squash season! Butternut squash is an excellent alternative to potatoes. Low GI.",
        up: 105,
        down: 1,
        user: user_three,
        created_at: 20.hours.ago
    },
    {
        content: "Legumes are your friends: lentils, beans, chickpeas... High in fiber and low GI.",
        up: 70,
        down: 0,
        user: user_four,
        created_at: 2.hours.ago
    },
    {
        content: "Quick reminder: 'sugar-free' doesn't mean 'carb-free'. Always check the nutrition label.",
        up: 110,
        down: 5,
        user: user_four,
        created_at: Time.now
    }
])

puts "Created #{Post.count} posts in total."
