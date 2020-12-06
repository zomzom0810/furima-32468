class BuyStreet
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number, :token, :user_id, :item_id
  
    with_options presence: true do
      validates :postal_code, 
                format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :municipality
      validates :address
      validates :phone_number,
                format: {with: /\A\d{11}\z/, message: "は11桁以内の半角数字で入力してくだい"}
      validates :token
      validates :user_id
      validates :item_id    
      validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }            
    end

    

    def save
      buy = Buy.create(user_id: user_id, item_id: item_id)
      Street.create(postal_code: postal_code, prefecture_id: prefecture_id,  municipality: municipality, address: address, building: building, phone_number: phone_number, buy_id: buy.id)
    end
  end