require_relative 'seeders/user_seeder'

UserSeeder.define do
  user email_address: 'user@example.com', password: '1' do
    products <<~END
      onion: 60kcal / 100gr
      mince meat: 332kcal / 100gr
      potatoes: 93kcal / 100gr
      yogurt: 59kcal / 100gr
      tomato: 40kcal / 100gr
      egg: 80kcal / 1egg
      butter: 750kcal / 100gr
      kashkaval: 400kcal / 100gr
      flour: 350kcal / 100gr
      vegatable oil: 900kcal / 100gr
    END

    recipe 'Moussaka', <<~END
      # Ingredients:

      mince meat: 500gr
      onion: 200gr
      potatoes: 1000gr
      tomato: 400gr
      yogurt: 400gr
      egg: 2
      flour: 50gr
      vegatable oil: 40gr

      # Instructions:

      1. Cut the onion and fry it in the oil.
      2. Add the mince meat and fry it.
      3. Add the potatoes and fry them.
      4. Add the tomato and fry it.
      5. Add the yogurt and fry it.
      END
  end

  user email_address: 'another@example.com', password: '1'
end

