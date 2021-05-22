require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do
      it 'nickname,email,password,ユーザー本名,フリガナ,生年月日があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意性でないと登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'kkk.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'paswordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'paswordが6文字以上でないと登録できない' do
        @user.password = 'a2345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'paswordは、半角英字だけでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'paswordは、半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが全角の場合は登録できない' do
        @user.password = '亞アあ１'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'paswordとpasword（確認用）は、値が一致でないと登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'ユーザー本名は、名字が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'ユーザー本名は、名前が空だと登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end

      it 'ユーザー本名は、名字が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = '1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'ユーザー本名は、名前が全角（漢字・ひらがな・カタカナ）でないと登録できない' do
        @user.family_name = '1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end

      it 'ユーザー本名のフリガナは、名字が空だと登録できない' do
        @user.family_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name full width can't be blank")
      end

      it 'ユーザー本名のフリガナは、名前が空だと登録できない' do
        @user.first_name_full_width = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name full width can't be blank")
      end

      it 'ユーザー本名のフリガナは、名字が全角（カタカナ）でないと登録できない' do
        @user.family_name_full_width = '亞あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name full width is invalid')
      end

      it 'ユーザー本名のフリガナは、名前が全角（カタカナ）でないと登録できない' do
        @user.first_name_full_width = '亞あ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name full width is invalid')
      end

      it '生年月日が空だと登録できない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
    end
  end
end
