require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
   before do
    @item = FactoryBot.build(:item)
   end
  

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "全ての項目があれば保存される" do
        expect(@item).to be_valid
      end
    end
    
    context "商品が保存できない場合" do
      it "imegeがないと商品は保存できない" do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "explanationがないと商品は保存できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "status_idが1だと商品は保存できない" do
        @iteｍ.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status id can't be blank")
      end
      it "delivery_fee_idが1だと商品は保存できない" do
        @iteｍ.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee id can't be blank")
      end
      it "prefecture_idが1だと商品は保存できない" do
        @iteｍ.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectureid id can't be blank")
      end
      it "delivery_day_idが1だと商品は保存できない" do
        @iteｍ.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day id can't be blank")
      end
      it "priceがないと商品は保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price300円より少ないと商品は保存できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "price9,999,999円より大きいと商品は保存できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
        it "ユーザーが紐付いていないとツイートは保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
end
