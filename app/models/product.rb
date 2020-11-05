class Product < ApplicationRecord
  belongs_to :user
  belongs_to :categories
  has_one_attached :image

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :how_many_days_id, numericality: { other_than: 1 }
  validates :price, format: { with: /\A[0-9]+\z/ }
            :numericality => { :greater_than_or_equal_to => 300,
                               :less_than_or_equal_to => 9999999,
                             }
  validates :image, presence: true

  
end
