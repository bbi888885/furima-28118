class ProductsController < ApplicationController
  before_action :find_params, only: [:edit, :show]

  def index
    @products = Product.order('created_at DESC')
  end

  def show
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      @product.update(product_params)
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:image, :item, :description, :category_id, :status_id, :price,
                                    :delivery_cost_id, :shipping_area_id, :how_many_day_id).merge(user_id: current_user.id)
  end

  def find_params
    @product = Product.find(params[:id])
  end
end
