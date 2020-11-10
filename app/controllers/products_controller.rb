class ProductsController < ApplicationController
  before_action :find_params, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show, :update]
  #before_action :authenticate_user!

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
    unless current_user.id == @product.user_id
      redirect_to action: :index
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
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

  def move_to_index
    authenticate_user!
  end
end
