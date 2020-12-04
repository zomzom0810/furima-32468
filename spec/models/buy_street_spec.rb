require 'rails_helper'


  RSpec.describe BuyStreet, type: :model do
    describe '住所の保存' do
      before do
        @buy_street = FactoryBot.build(:buy_street)
      end

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_street).to be_valid
      end
      it 'postal_code が空だと保存できないこと' do
        @buy_street.postal_code = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefectureが空だと保存できないこと' do
        @buy_street.prefecture = nil
        @buy_street.valid?
        expect(@buy_street.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureが1だと保存できないこと' do
        @buy_street.prefecture = 1
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
    end
  end