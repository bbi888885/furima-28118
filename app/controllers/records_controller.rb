class RecordsController < ApplicationController
  before_action :set_product, only: [:index, :create]
  before_action :authenticate_user!

  def index
    redirect_to root_path unless current_user.id != @product.user_id
    redirect_to root_path if @product.record.present? && @product.id == @product.record.product_id
    @delivery_record = DeliveryRecord.new 
  end

  def create
    @delivery_record = DeliveryRecord.new(record_params)
    if @delivery_record.valid?
      pay_item
      @delivery_record.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:delivery_record).permit(:token, :postal_code, :prefecture_id, :city, :banchi,
                                            :building_name, :tel).merge(user_id: current_user.id, 
                                                                        product_id: params[:product_id])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @product[:price],  # 商品の値段
      card: record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
  

end