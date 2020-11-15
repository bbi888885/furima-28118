class RecordsController < ApplicationController
  before_action :set_product, only: [:index, :create]


  def index
    @delivery_record = DeliveryRecord.new 
  end

  def create
    @delivery_record = DeliveryRecord.new(record_params)
    if @delivery_record.valid?
      pay_item
      @delivery_record.save
      return redirect_to action: :index
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:delivery_record).permit(:user_id, :product_id, :postal_code, :prefecture_id,
                                            :city, :banchi, :building_name, :tel).merge(token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  

end