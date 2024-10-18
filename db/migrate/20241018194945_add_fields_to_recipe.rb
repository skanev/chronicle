class AddFieldsToRecipe < ActiveRecord::Migration[8.0]
  def change
    add_column :recipes, :source_url,   :text, null: true
    add_column :recipes, :instructions, :text, null: false, default: ''
    change_column_default :recipes, :instructions, from: '', to: nil
  end
end
