require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@purchase_address).to be_valid
    end
    it '郵便番号が空だと保存できないこと' do
      @purchase_address.postal_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角数字でないと保存できないこと' do
      @purchase_address.postal_code = '１２３−４５６７'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Input half-width characters')
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @purchase_address.postal_code = 1_534_987
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Postal code is invalid. Input half-width characters')
    end
    it '都道府県を選択していないと保存できないこと' do
      @purchase_address.prefecture_id = 0
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市区町村が空だと保存できないこと' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end
    it '市区町村が全角日本語でないと保存できないこと' do
      @purchase_address.city = 'Yokohamashi'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('City is invalid. Input full-width characters')
    end
    it '番地が空だと保存できないこと' do
      @purchase_address.house_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
    end
    it '番地が全角日本語でないと保存できないこと' do
      @purchase_address.house_number = 'hoge1-1'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('House number is invalid. Input full-width characters')
    end
    it '建物名が空でも保存できること' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @purchase_address.phone_number = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号がが半角数字でないと保存できないこと' do
      @purchase_address.phone_number = '１２３４５６７８９１０'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input half-width characters')
    end
    it '電話番号に半角英字が入ってると保存できないこと' do
      @purchase_address.phone_number = 'i9093838003'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input half-width characters')
    end
    it '電話番号が12文字以上だと保存できないこと' do
      @purchase_address.phone_number = 909876543211
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
    end
    it 'tokenが空だと保存できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'user_idが空だと保存できないこと' do
      @purchase_address.user_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("User can't be blank")
    end
    it 'item_idが空だと保存できないこと' do
      @purchase_address.item_id = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
