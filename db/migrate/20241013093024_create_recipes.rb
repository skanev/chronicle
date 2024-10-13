class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.references :user,   null: false, foreign_key: true
      t.string     :name,   null: false

      t.timestamps
    end

    create_table :ingredients do |t|
      t.references :recipe,   null: false, foreign_key: true
      t.references :product,  null: false, foreign_key: true
      t.decimal    :quantity, null: false

      t.timestamps
    end
  end
end
