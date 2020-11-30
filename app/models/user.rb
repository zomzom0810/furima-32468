class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX =  /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze #半角英数字混合である
  with_options presence: true do
    validates :nickname, length: { maximum: 40}
    validates :birthday
    validates :first_name_kana, :last_name_kana,
               format: {with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/, message: 'にはカタカナを使って入力してください'} #カタカナのみ
    validates :password, format: {with: VALID_PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'}
    validates :first_name,:last_name,
               format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には『漢字』、『ひらがな』、『かたかな』を使って入力してください'} #漢字カナかな
end  
end
