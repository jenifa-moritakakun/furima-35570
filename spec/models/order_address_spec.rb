require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @order = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user2.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it '郵便番号、都道府県、市区町村、番地、電話番号、カード情報があれば購入できる' do
        expect(@order).to be_valid
      end

      it '建物名が空でも購入できる' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @order.postal_code = '0123456'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '都道府県が空だと購入できない' do
        @order.shipping_area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '都道府県のidが1だと購入できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it '市区町村が空だと購入できない' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地が空だと購入できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include
      end

      it '電話番号が12桁だと購入できない' do
        @order.phone_number = '012345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include
      end

      it '電話番号が英字だと購入できない' do
        @order.phone_number = 'a2345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include
      end

      it 'カード情報が空では購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空だと購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空だと購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
