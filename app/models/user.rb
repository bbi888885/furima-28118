class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, 
                    length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
                    
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX },
                       presence: true, length: { minimum: 6 },
                       confirmation: true

  validates :birthday, presence: true

  validates :lastname, presence: true,
                       format: {
                       with: /\A[ぁ-んァ-ン一-龥]/,
                       message: "全角カタカナのみで入力して下さい"
                       }
  validates :firstname, presence: true,
                        format: {
                        with: /\A[ぁ-んァ-ン一-龥]/,
                        message: "全角カタカナのみで入力して下さい"
                        }

  validates :furigana_lastname, presence: true,
                                format: {
                                with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                                message: "全角カタカナのみで入力して下さい"
                                }
  validates :furigana_firstname, presence: true,
                                 format: {
                                 with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                                 message: "全角カタカナのみで入力して下さい"
                                 }

end
