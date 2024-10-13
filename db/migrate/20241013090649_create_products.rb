class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :user,           null: false, foreign_key: true
      t.string     :name,           null: false
      t.integer    :calories,       null: false
      t.string     :unit,           null: false
      t.integer    :units_per_kcal, null: false

      t.timestamps
    end
  end
end
