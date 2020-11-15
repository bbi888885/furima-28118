class RecordsController < ApplicationController

  def index
    @delivery_record = DeliveryRecord.new 
    @product = Product.find(params[:product_id])
  end

  def create
    @delivery_record = DeliveryRecord.new(record_params)
    if @delivery_record.valid?
      @delivery_record.save
      return redirect_to action: :index
    else
      render 'index'
    end
  end

  private

  def record_params
    params.require(:delivery_record).permit(:user_id, :product_id, :postal_code, :prefecture_id,
                                            :city, :banchi, :building_name, :tel)
  end

  

end