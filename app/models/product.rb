class Product < ApplicationRecord
  belongs_to :user
  belongs_to :categories
  has_one_attached :image

  validates :categories_id, numericality: { other_than: 1 }

end
