require 'rails_helper'

# RSpec.describe Item, type: :model do
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end  

  describe '商品出品機能' do
    context '商品を出品できる時' do
      it '必要な情報を全て入力すると出品できる' do
        expect(@item).to be_valid
      end
    end
    
    context '商品を出品できない時' do
      it '商品名がないと出品できない' do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      
      it '出品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明がないと出品できない' do
        @item.detail = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end

      it 'カテゴリーを選択してないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end

      it '商品の状態を選択してないと出品できない' do
        @item.condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 0")
      end

      it '配送料の負担を選択してないと出品できない' do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 0")
      end

      it '発送元の地域を選択してないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it '発送までの日数を選択してないと出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 0")
      end

      it 'ユーザーが紐づいてないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end  

      it '販売価格を入力しないと出品できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が半角数字でないと出品できない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が整数でないと出品できない' do
        @item.price = "500.55"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be an integer")
      end  

      it '販売価格が300円未満だと出品できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が10000000円以上だと出品できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end  
  end
end  
