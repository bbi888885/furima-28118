class Delivery < ApplicationRecord
  belongs_to :record

  VALID_PHONE_REGEX = /^\d{11}$/

  with_option presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :banchi
    validates :tel
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :tel, format: { with: VALID_PHONE_REGEX }

end
