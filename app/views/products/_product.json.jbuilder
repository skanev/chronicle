json.extract! product, :id, :name, :calories, :unit, :units_per_kcal, :created_at, :updated_at
json.url product_url(product, format: :json)
