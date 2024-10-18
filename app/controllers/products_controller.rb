class ProductsController < ApplicationController
  def index
    @products = current_user.products.includes(:ingredients).to_a
  end

  def create
    product = current_user.products.new product_params

    if product.save
      render turbo_stream: [
        turbo_stream.replace(:new_product, partial: 'create', locals: {product: current_user.products.new}),
        turbo_stream.append(:products, product)
      ]
    else
      render turbo_stream: turbo_stream.replace(:new_product, partial: 'create', locals: {product:})
    end
  end

  def edit
    product = find_product

    render turbo_stream: turbo_stream.replace(product, partial: 'form', locals: {product:})
  end

  def update
    product = find_product

    if product.update product_params
      render turbo_stream: turbo_stream.replace(product)
    else
      render turbo_stream: turbo_stream.replace(product, partial: 'form', locals: {product:})
    end
  end

  def destroy
    product = find_product
    product.destroy!
    render turbo_stream: turbo_stream.remove(product)
  end

  private

  def find_product
    current_user.products.find params[:id]
  end

  def product_params
    params.expect(product: [:name, :calories, :unit, :units_per_kcal])
  end
end
