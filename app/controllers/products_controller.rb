class ProductsController < ApplicationController
  before_action :find_params, only: [:edit, :show, :destroy, :update]
  before_action :authenticate_user!, except: [:index, :show, :update, :search]

  def index
    @products = Product.order('created_at DESC')
  end

  def show
    @comment = Comment.new
    @comments = @product.comments.order('created_at DESC')
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

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_patha
    end
  end

  def search
    @products = Product.search(params[:keyword])
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
