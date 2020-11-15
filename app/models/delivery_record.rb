class DeliveryRecord
  include ActiveModel::Model
  attr_accessor :user.id, :product.id, :postal_code, :prefecture_id, :city, :banchi, :building_name, :tel
end