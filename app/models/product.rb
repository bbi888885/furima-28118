class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1, message: "can not be blank" }
  validates :status_id, numericality: { other_than: 1, message: "can not be blank" }
  validates :delivery_cost_id, numericality: { other_than: 1, message: "can not be blank" }
  validates :shipping_area_id, numericality: { other_than: 1, message: "can not be blank" }
  validates :how_many_days_id, numericality: { other_than: 1, message: "can not be blank" }
  validates :price, format: { with: /\A[0-9]+\z/ },
                    numericality: {
                      greater_than_or_equal_to: 300,
                      less_than_or_equal_to: 9_999_999
                    }
  validates :image, presence: true
  validates :item, presence: true
  validates :description, presence: true
end
