require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージ機能' do
    context '投稿できるとき' do
      it 'contentとimageが存在していれば保存できること' do
        expect(@message).to be_valid
      end

      it 'contentが空でも保存できること' do
        @message.content = ''
        expect(@message).to be_valid
      end

      it 'imageが空でも保存できること' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context '投稿できないとき' do
      it 'contentとimageが空では保存できないこと' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Content translation missing: ja.activerecord.errors.models.message.attributes.content.blank"
      end
      it 'roomが紐付いていないと保存できないこと' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Room translation missing: ja.activerecord.errors.models.message.attributes.room.required"
      end

      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "User translation missing: ja.activerecord.errors.models.message.attributes.user.required"
      end
    end
  end
end