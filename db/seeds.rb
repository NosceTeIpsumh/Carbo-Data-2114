puts "Destroying Users..."
User.destroy_all

puts "Creating Users..."

# Existing Users (4 Total)
user_one = User.find_or_create_by!(email: "test@test.com") do |user|
    user.password = "test2025"
    user.password_confirmation = "test2025"
    user.profile_name = "Nosce Te Ipsum"
end

user_two = User.find_or_create_by!(email: "test2@test.com") do |user|
    user.password = "test2026"
    user.password_confirmation = "test2026"
    user.profile_name = "Martduss"
end

# 2 New Users (Total now 4)
user_three = User.find_or_create_by!(email: "test3@test.com") do |user|
    user.password = "test2027"
    user.password_confirmation = "test2027"
    user.profile_name = "Thibault Dup"
end

user_four = User.find_or_create_by!(email: "test4@test.com") do |user|
    user.password = "test2028"
    user.password_confirmation = "test2028"
    user.profile_name = "Tim Boods"
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
    user_id: user_two.id
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
  }
])

puts "Created #{Recipe.count} Recipes."

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
    user_id: user_two.id
  },
  {
    name: "Lentils (Brown)",
    brand: "Generic",
    category: "Grains & Legumes",
    indice_gly: 32,
    ratio_glucide: 11,
    user_id: user_two.id
  },
  # 15 Additional Items
  {
    name: "Brown Rice",
    brand: "Tilda",
    category: "Grains & Legumes",
    indice_gly: 50,
    ratio_glucide: 25,
    user_id: user_three.id
  },
  {
    name: "Sweet Potato",
    brand: "N/A",
    category: "Fruits & Vegetables",
    indice_gly: 63,
    ratio_glucide: 20,
    user_id: user_four.id
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
    user_id: user_two.id
  },
  {
    name: "Quinoa",
    brand: "Generic",
    category: "Grains & Legumes",
    indice_gly: 53,
    ratio_glucide: 21,
    user_id: user_three.id
  },
  {
    name: "Chickpeas (Canned)",
    brand: "Casbah",
    category: "Grains & Legumes",
    indice_gly: 33,
    ratio_glucide: 19,
    user_id: user_four.id
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
    user_id: user_three.id
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
    user_id: user_two.id
  },
  # Fats & Oils
  {
    name: "Olive Oil (Extra Virgin)",
    brand: "Puget",
    category: "Fats & Oils",
    indice_gly: 0,
    ratio_glucide: 0,
    user_id: user_three.id
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
puts "Création des posts..."

# The original 4 posts are created using the existing code style
Post.create!(
    content: "Ceci est un post de test standard!",
    up: 45,
    down: 5,
    user: user_one,
    created_at: 1.day.ago
)

Post.create!(
    content: "J'ai découvert une recette géniale, je la partage avec vous!",
    up: 120,
    down: 3,
    user: user_one,
    created_at: 12.hours.ago
)

Post.create!(
    content: "Le sucre caché dans les aliments. Discutons-en.",
    up: 15,
    down: 25,
    user: user_two,
    created_at: 5.hours.ago
)

Post.create!(
    content: "Nouveau produit Carrefour disponible, qui l'a déjà testé ?",
    up: 8,
    down: 0,
    user: user_two,
    created_at: Time.now
)

# 15 Additional Posts
Post.create!([
    {
        content: "Quelqu'un a-t-il une bonne alternative au riz blanc pour le dîner ? Je cherche quelque chose de GI faible.",
        up: 35,
        down: 2,
        user: user_three,
        created_at: 3.hours.ago
    },
    {
        content: "Avis aux diabétiques : attention aux jus de fruits 'sans sucre ajouté', l'IG reste élevé !",
        up: 50,
        down: 1,
        user: user_four,
        created_at: 2.hours.ago
    },
    {
        content: "Je teste le pain de seigle aujourd'hui. L'IG est meilleur que le pain complet standard. Je vous tiens au courant !",
        up: 22,
        down: 0,
        user: user_one,
        created_at: 1.hour.ago
    },
    {
        content: "Recette du jour : Salade de pois chiches et féta. Simple, rapide, et IG au top. Je la poste bientôt.",
        up: 78,
        down: 4,
        user: user_two,
        created_at: 45.minutes.ago
    },
    {
        content: "Mon taux de glycémie monte toujours après le petit-déjeuner. Des idées de collations matinales à faible IG ?",
        up: 10,
        down: 5,
        user: user_three,
        created_at: 30.minutes.ago
    },
    {
        content: "Le sport après le repas, ça aide vraiment à réguler la glycémie. Qui pratique ?",
        up: 60,
        down: 0,
        user: user_four,
        created_at: 20.minutes.ago
    },
    {
        content: "Déçu par les pâtes sans gluten. Le goût n'y est pas. Des marques à recommander ?",
        up: 5,
        down: 15,
        user: user_one,
        created_at: 15.minutes.ago
    },
    {
        content: "Les légumes racines (carottes, betteraves) crus ont un IG bien plus bas que cuits. Info importante à savoir !",
        up: 90,
        down: 1,
        user: user_two,
        created_at: 10.minutes.ago
    },
    {
        content: "Je cherche des recettes de desserts avec des édulcorants naturels (stévia, erythritol). Partagez vos meilleures astuces !",
        up: 18,
        down: 0,
        user: user_three,
        created_at: 8.minutes.ago
    },
    {
        content: "Le mythe du 'cheat meal'. Est-ce vraiment bénéfique ou est-ce juste une excuse pour craquer ?",
        up: 40,
        down: 30,
        user: user_four,
        created_at: 5.minutes.ago
    },
    {
        content: "Tendance du jeûne intermittent (IF). Quels sont vos résultats sur la sensibilité à l'insuline ?",
        up: 150,
        down: 10,
        user: user_one,
        created_at: 4.minutes.ago
    },
    {
        content: "Attention à l'indice glycémique du maïs soufflé. Ça monte vite !",
        up: 5,
        down: 2,
        user: user_two,
        created_at: 3.minutes.ago
    },
    {
        content: "C'est la saison des courges ! La courge butternut est une excellente alternative à la pomme de terre. GI faible.",
        up: 105,
        down: 1,
        user: user_three,
        created_at: 2.minutes.ago
    },
    {
        content: "Les légumineuses sont vos amies : lentilles, haricots, pois chiches... Riches en fibres et GI bas.",
        up: 70,
        down: 0,
        user: user_four,
        created_at: 1.minute.ago
    },
    {
        content: "Petit rappel : 'sans sucre' ne veut pas dire 'sans glucides'. Toujours vérifier l'étiquette nutritionnelle.",
        up: 110,
        down: 5,
        user: user_one,
        created_at: Time.now
    }
])

puts "Created #{Post.count} posts au total."
