class UserSeeder
  class << self
    def define(&block)
      DSL.new.instance_eval(&block)
    end
  end

  class DSL
    def user(**attributes, &block)
      seeder = UserSeeder.new(**attributes)
      seeder.instance_eval(&block) if block_given?
    end
  end

  attr_reader :user

  def initialize(**attributes)
    @user = User.create!(attributes)
    @products = {}
  end

  def products(text)
    text.lines.each do |line|
      /^(?<name>.+): (?<calories>\d+)kcal \/ (?<units_per_kcal>\d+)(?<unit>.+)$/ =~ line or raise "Invalid line: #{line}"
      @products[name] = Product.create! name:, calories:, user: @user, units_per_kcal:, unit:
    end
  end

  def recipe(name, text)
    recipe = Recipe.new name:, user: @user

    text.split(/^# /).reject(&:empty?).each do |chunk|
      section, body = chunk.split("\n", 2)

      case section
      in 'Ingredients:'
        body.lines.each do |line|
          next if line.strip.empty?
          /^(?<name>.+): (?<quantity>\d+)(?<unit>.+)?$/ =~ line or raise "Invalid line: #{line}"
          recipe.ingredients.build product: @products.fetch(name), quantity: quantity
        end
      in 'Instructions:'
        recipe.instructions = body
      end
    end

    recipe.save!
  end
end
