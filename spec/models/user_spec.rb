require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail,passwordとencrypted_passwordが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとencrypted_passwordが６文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.encrypted_password = 'aaa111'
        expect(@user).to be_valid
      end
      it 'profileは空でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname translation missing: ja.activerecord.errors.models.user.attributes.nickname.blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email translation missing: ja.activerecord.errors.models.user.attributes.email.blank"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password translation missing: ja.activerecord.errors.models.user.attributes.password.blank"
      end
      it 'passwordとencrypted_passwordが不一致では登録できない' do
        @user.password = '1234568'
        @user.encrypted_password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '55555'
        @user.encrypted_password = '55555'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password translation missing: ja.activerecord.errors.models.user.attributes.password.too_short"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email translation missing: ja.activerecord.errors.models.user.attributes.email.taken"
      end
    end
  end
end