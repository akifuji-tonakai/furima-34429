require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @ordadd = FactoryBot.build(:order_address)
  end

  describe '購入処理テスト' do
    context '購入処理出来た' do
      it '正しく記入して購入出来た' do
        expect(@ordadd).to be_valid
      end
      it '電話番号が９桁でも購入できた'do
        @ordadd.tele_number = "012345678"
        expect(@ordadd).to be_valid
      end
      it '建物名がなくても購入できた' do
       @ordadd.building_detail = ""
       expect(@ordadd).to be_valid 
      end
    end
    
    context '購入処理出来なかった' do
      it '郵便番号が空' do
        @ordadd.post_number = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号にハイフンがなかった' do
        @ordadd.post_number = "12345678"
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Post number Should input correctly including '-' ")
      end
      it '郵便番号が７桁だった' do
        @ordadd.post_number = "1234567"
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Post number is too short (minimum is 8 characters)")
      end
      it '郵便番号が全角だった' do
        @ordadd.post_number = "１２３−４５６７"
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Post number Should input correctly including '-' ")
      end
      it '発送先住所が選択されていなかった' do
        @ordadd.send_from_id = 1
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Send from Should be selected")
      end
      it '市町村が空だった' do
        @ordadd.village_name = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Village name can't be blank")
      end
      it '番地が空だった' do
        @ordadd.village_number = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Village number can't be blank")
      end
      it '電話番号が空だった' do
        @ordadd.tele_number = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Tele number can't be blank")
      end
      it '電話番号が短かった' do
        @ordadd.tele_number = "01234567"
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Tele number is too short (minimum is 9 characters)")
      end
      it '電話番号が全角だった' do
        @ordadd.tele_number = "０１２３４５６７８"
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Tele number only Number",)
      end
      it 'トークンが空だった' do
        @ordadd.token = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idがなかった' do
        @ordadd.user_id = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがなかった' do
        @ordadd.item_id = ""
        @ordadd.valid?
        expect(@ordadd.errors.full_messages).to include("Item can't be blank")
      end
    end

  end
end
