class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])[a-z\d]{6,32}+\z/.freeze
  
  with_options presence: true do
    validates :nickname
    validates :email, uniqueness: true,
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX } 
    validates :password, format: { with: VALID_PASSWORD_REGEX },
                       length: { minimum: 6 },
                       confirmation: true
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :lastname
      validates :firstname
    end

    with_options format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/ } do
      validates :furigana_lastname
      validates :furigana_firstname
    end
  end
end
