user = User.create! email_address: 'user@example.com', password: '1'

onion  = Product.create! name: 'Onion', calories: 60, user: user, units_per_kcal: 100, unit: 'gr'
tomato = Product.create! name: 'Tomato', calories: 40, user: user, units_per_kcal: 100, unit: 'gr'
egg    = Product.create! name: 'Egg', calories: 80, user: user, units_per_kcal: 1, unit: 'egg'
butter = Product.create! name: 'Butter', calories: 750, user: user, units_per_kcal: 100, unit: 'gr'

slop = Recipe.create! name: 'Egg slop', user: user
slop.ingredients.create! product: onion, quantity: 200
slop.ingredients.create! product: tomato, quantity: 100
slop.ingredients.create! product: egg, quantity: 2

omlette = Recipe.create! name: 'Omlette', user: user
omlette.ingredients.create! product: egg, quantity: 2
omlette.ingredients.create! product: butter, quantity: 40

another = User.create! email_address: 'another@example.com', password: '1'

Product.create! name: 'Cucumber', calories: 20, user: another, units_per_kcal: 100, unit: 'gr'
