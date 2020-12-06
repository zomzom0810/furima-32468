require 'rails_helper'


  RSpec.describe BuyStreet, type: :model do
    describe '住所の保存' do
      before do
        @buy_street = FactoryBot.build(:buy_street)
      end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_street).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @buy_street.building = nil 
        expect(@buy_street).to be_valid
      end

      it 'postal_code が空だと保存できないこと' do
        @buy_street.postal_code = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_street.postal_code = "0000000"
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureが空だと保存できないこと' do
        @buy_street.prefecture_id = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが1だと保存できないこと' do
        @buy_street.prefecture_id = 1
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空だと保存できないこと' do
        @buy_street.municipality = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @buy_street.address = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buy_street.phone_number = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが11桁以上だと保存できないこと' do
        @buy_street.phone_number = "1234567891234"
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Phone number は11桁以内の半角数字で入力してくだい")
      end
      it 'phone_numberに（-）が入っていると保存できないこと' do
        @buy_street.phone_number = "123456-7891234"
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Phone number は11桁以内の半角数字で入力してくだい")
      end
      it 'phone_numberに数字意外が入っていると保存できないこと' do
        @buy_street.phone_number = "accdc"
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Phone number は11桁以内の半角数字で入力してくだい")
      end
      it 'user_idが空だと保存できないこと' do
        @buy_street.user_id = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("User can't be blank")
      end
        it 'item_idが空だと保存できないこと' do
          @buy_street.item_id = nil
          @buy_street.valid?
          expect(@buy_street.errors.full_messages).to include("Item can't be blank")
        end
      it "tokenが空では登録できないこと" do
        @buy_street.token = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Token can't be blank")
      end
    end
  end