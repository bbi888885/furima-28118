class Record < ApplicationRecord
  belongs_to :user
  has_one :delivery
  belongs_to :product

  
end
