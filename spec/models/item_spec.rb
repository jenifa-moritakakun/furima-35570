require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '内容に問題がない場合' do
      it '商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、配送先、配送にかかる日にち、販売価格があれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '商品画像が空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it 'カテゴリーの情報が空だと出品できない' do
        @item.details_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details category can't be blank")
      end

      it 'カテゴリーのidが1だと出品できない' do
        @item.details_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Details category must be other than 1")
      end

      it '商品の状態についての情報が空だと出品できない' do
        @item.details_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Details status can't be blank")
      end

      it '商品の状態についてのidが1だと出品できない' do
        @item.details_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Details status must be other than 1")
      end

      it '配送料の負担についての情報が空だと出品できない' do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
      end

      it '配送料の負担についてのidが1だと出品できない' do
        @item.shipping_charges_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
      end

      it '発送元の地域についての情報が空だと出品できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '配送元の地域についてのidが1だと出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '発送までの日数についての情報が空だと出品できない' do
        @item.shipping_days_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days can't be blank")
      end

      it 'のidが1だと出品できない' do
        @item.shipping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping days must be other than 1")
      end

      it '販売価格についての情報が空だと出品できない' do
        @item.selling_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Selling price can't be blank")
      end

      it '販売価格は299円以下では出品できない' do
        @item.selling_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end

      it '販売価格は10000000円以上では出品できない' do
        @item.selling_price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not included in the list')
      end

      it '販売価格は全角数字では保存できない' do
        @item.selling_price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it '販売価格は全角文字では保存できない' do
        @item.selling_price = '亞アあ'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it '販売価格は半角英数字混合では保存できない' do
        @item.selling_price = 'a2345'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end

      it '販売価格は半角英語では保存できない' do
        @item.selling_price = 'aiueo'
        @item.valid?
        expect(@item.errors.full_messages).to include('Selling price is not a number')
      end
    end
  end
end
