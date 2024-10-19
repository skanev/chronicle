class ChangeIngredientsQuantityToInteger < ActiveRecord::Migration[8.0]
  def up
    change_column :ingredients, :quantity, :integer
  end

  def down
    change_column :ingredients, :quantity, :decimal
  end
end
