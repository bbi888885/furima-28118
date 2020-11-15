class DeliveryRecord
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postal_code, :prefecture_id, :city, :banchi, :building_name, :tel, :token
  

  with_options presence: true do
    validates :postal_code
    validates :city
    validates :banchi
    validates :tel
    validates :token
  end

  validates :prefecture_id, numericality: { other_than: 0 }
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
  validates :tel, format: { with: /\A[0-9]+\z/},
                  length: { maximum: 12 }

  def save
    # ユーザーの情報を保存
    Record.create(user_id: user_id, product_id: product_id)
    # 住所の情報を保存
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, banchi: banchi, building_name: building_name, tel: tel)
  end

end