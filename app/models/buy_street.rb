class BuyStreet
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :phone_number
  
    with_options presence: true do
      validates :postal_code, 
                format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
      validates :municipality
      validates :address
      validates :phone_number,
                format: {with: /\A\d{11}\z/, message: "は11桁以内の半角数字で入力してくだい"}
    end

    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

    def save
      buy = Buy.create(user_id: user.id, item_id: item.id)
      Street.create(postal_code: postal_code, prefecture: prefecture,  municipality: municipality, address: address, building: building, phone_number: phone_number)
    end
  end