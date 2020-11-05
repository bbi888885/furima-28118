class Product < ApplicationRecord
  belongs_to :user
  belongs_to :categories
  has_one_attached :image

  validates :categories_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_cost_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 1 }
  validates :how_many_days_id, numericality: { other_than: 1 }



  
end
