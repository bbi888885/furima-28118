class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1, message: "can not be blank" } do
    validates :category_id 
    validates :status_id
    validates :delivery_cost_id
    validates :shipping_area_id
    validates :how_many_days_id
  end
  validates :price, format: { with: /\A[0-9]+\z/ },
                    numericality: {
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999
                    }
  with_options presence: true do
    validates :image
    validates :item
    validates :description
  end
end
