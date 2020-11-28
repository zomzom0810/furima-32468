class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =  /(?=.*\d+.*)(?=.*[a-zA-Z]+.*).*[!@#$%]+.*/
  validates :nickname, :birthday, presence: true
  validates :first_name_kana, :last_name_kana, presence: true,
            format: {with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/}
  validates :password, format: {with: VALID_PASSWORD_REGEX}
  validates :first_name,:last_name, presence: true, format: {with: /\A^[ぁ-んァ-ンー－]+\z/}
end
