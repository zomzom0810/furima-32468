class StreetBuy
    include ActiveModel::Model
    attr_accessor :postal_code, :prefecture, :municipality, :address, :building, :phone_number
  
    with_options presence: true do
      validates :postal_code
      validates :municipality
      validates :address
      validates :building
      validates :phone_number
    end

    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

    def save
      street = Street.create(postal_code: postal_code, prefecture: prefecture,  municipality: municipality, address: address, building: building, phone_number: phone_number)
      Buy.create(user_id: user.id, item_id: item.id)
    end
  end