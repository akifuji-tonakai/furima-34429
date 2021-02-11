require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品登録' do
    context '商品登録できた' do
      it '全部のフォームに正しく記入し正常に商品登録できた' do
        expect(@item).to be_valid
      end
      it '名前が40字で登録できた' do
        @item.name = Faker::Number.number(digits: 40)
        expect(@item).to be_valid
      end
      it '商品紹介が1000字で登録できた' do
        @item.introduction = Faker::Number.number(digits: 100)
        expect(@item).to be_valid
      end
      it '値段を300と記入し正常に商品登録できた' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it '値段を9999999と記入し正常に商品登録できた' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '商品登録出来なかった' do
      it '名前が空だと登録出来ない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '名前が長すぎると登録出来ない' do
        @item.name = Faker::Number.number(digits: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it '商品紹介が空だと登録できない' do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it '商品紹介が長すぎると登録できない' do
        @item.introduction = Faker::Number.number(digits: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)")
      end
      it '画像が添付されていないと登録できない' do
        @item.item_image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item image can't be blank")
      end
      it '価格が設定されていないと登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が全角数字だと登録できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Is in incorrect range")
      end
      it '価格が299円だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Is in incorrect range")
      end
      it '価格が10000000だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Is in incorrect range")
      end
      it 'カテゴリーが選択されないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Should be selected")
      end
      it '商品の状態が選択されないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Should be selected")
      end
      it '配送手数料負担が選択されないと登録できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee Should be selected")
      end
      it '配送元が選択されないと登録できない' do
        @item.send_from_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Send from Should be selected")
      end
      it '発送日数が選択されないと登録できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days Should be selected")
      end
      it 'ユーザーがいなければ商品登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end