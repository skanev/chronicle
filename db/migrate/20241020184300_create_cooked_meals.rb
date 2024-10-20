class CreateCookedMeals < ActiveRecord::Migration[8.0]
  def change
    create_table :cooked_meals do |t|
      t.references :user,      null: false, foreign_key: true
      t.references :recipe,    null: false, foreign_key: true
      t.date       :cooked_on, null: false
      t.integer    :weight,    null: true
      t.timestamps
    end

    create_table :cooked_meal_ingredients do |t|
      t.references :cooked_meal,    null: false, foreign_key: true
      t.string     :product,        null: false
      t.integer    :quantity,       null: false
      t.integer    :calories,       null: false
      t.string     :unit,           null: false
      t.integer    :units_per_kcal, null: false
      t.timestamps
    end
  end
end
