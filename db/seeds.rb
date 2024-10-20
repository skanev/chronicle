require_relative 'seeders/user_seeder'

UserSeeder.define do
  user email_address: 'user@example.com', password: '1' do
    products <<~END
      onion: 60kcal / 100g
      mince meat: 332kcal / 100g
      potatoes: 93kcal / 100g
      yogurt: 59kcal / 100g
      tomato: 40kcal / 100g
      eggs: 80kcal / 1egg
      butter: 750kcal / 100g
      kashkaval: 400kcal / 100g
      flour: 350kcal / 100g
      vegatable oil: 900kcal / 100g
    END

    recipe 'Moussaka', <<~END
      # Ingredients:

      mince meat: 500g
      onion: 200g
      potatoes: 1000g
      tomato: 400g
      yogurt: 400g
      eggs: 2
      flour: 50g
      vegatable oil: 40g

      # Instructions:

      1. Cut the onion and fry it in the oil.
      2. Add the mince meat and fry it.
      3. Add the potatoes and fry them.
      4. Add the tomato and fry it.
      5. Add the yogurt and fry it.
      END

    recipe 'Banitsa', <<~END
      # Ingredients:

      eggs: 2
      yogurt: 400g
      kashkaval: 200g
      butter: 100g
      flour: 500g

      # Instructions:

      1. Mix the eggs and the yogurt.
      2. Add the kashkaval and the butter.
      3. Add the flour.
      4. Bake in the oven
    END

    cooked_meal = CookedMeal.new user:, recipe: Recipe.find_by!(name: 'Moussaka'), cooked_on: Date.today
    cooked_meal.ingredients.build product: 'mince meat',    quantity: 550,  unit: 'g',   calories: 332, units_per_kcal: 100
    cooked_meal.ingredients.build product: 'onion',         quantity: 200,  unit: 'g',   calories: 60,  units_per_kcal: 100
    cooked_meal.ingredients.build product: 'potatoes',      quantity: 1200, unit: 'g',   calories: 93,  units_per_kcal: 100
    cooked_meal.ingredients.build product: 'tomato',        quantity: 400,  unit: 'g',   calories: 40,  units_per_kcal: 100
    cooked_meal.ingredients.build product: 'yogurt',        quantity: 350,  unit: 'g',   calories: 59,  units_per_kcal: 100
    cooked_meal.ingredients.build product: 'eggs',          quantity: 2,    unit: 'egg', calories: 80,  units_per_kcal: 1
    cooked_meal.ingredients.build product: 'flour',         quantity: 50,   unit: 'g',   calories: 350, units_per_kcal: 100
    cooked_meal.ingredients.build product: 'vegatable oil', quantity: 40,   unit: 'g',   calories: 900, units_per_kcal: 100
    cooked_meal.save!

    cooked_meal = CookedMeal.new user:, recipe: Recipe.find_by!(name: 'Banitsa'), cooked_on: Date.today
    cooked_meal.ingredients.build product: 'yogurt',        quantity: 350,  unit: 'g', calories: 59,  units_per_kcal: 100
    cooked_meal.ingredients.build product: 'eggs',          quantity: 2,    unit: 'g', calories: 80,  units_per_kcal: 1
    cooked_meal.ingredients.build product: 'vegatable oil', quantity: 40,   unit: 'g', calories: 900, units_per_kcal: 100
    cooked_meal.save!
  end

  user email_address: 'another@example.com', password: '1'
end

