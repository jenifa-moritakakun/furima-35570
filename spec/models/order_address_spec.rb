require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入' do
    before do
      @user1 = FactoryBot.create(:user)
      @user2 = FactoryBot.create(:user)
      @item = FactoryBot.create(:item, user_id: @user1.id)
      @order = FactoryBot.build(:order, item_id: @item.id, user_id: @user2.id )
    end

    context '内容に問題がない場合' do
      it '郵便番号、都道府県、市区町村、番地、電話番号があれば購入できる' do
        expect(@order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postalcode can't be blank")
      end

      it '郵便番号にハイフンがないと購入できない' do
        @order.postal_code = '0123456'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postalcode")
      end

      it '都道府県が空だと購入できない' do
        @order.shipping_area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Shippinngarea can't be blank")
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
        expect(@order.errors.full_messages).to include("Phonenumber can't be blank")
      end

      it '電話番号が12桁だと購入できない' do
        @order.phone_number = '012345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber")
      end

      it '電話番号が英字だと購入できない' do
        @order.phone_number = 'a2345678901'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phonenumber")
      end
    end
  end
end
