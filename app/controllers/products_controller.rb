class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
  end

  private
  def product_params
    params.require(:product).permit(:item, :description, :category_id, :status_id, :price,
                                    :delivery_cost_id, :shipping_area_id, :how_many_days_id, :user_id)
  end

end
