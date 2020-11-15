class Record < ApplicationRecord
  belongs_to :user
  has_one :delivery
  belongs_to :product
  has_one_attached :image
end
