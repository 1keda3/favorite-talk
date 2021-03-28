require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room_tag = FactoryBot.build(:room)
  end

  describe 'ルーム作成機能' do
    context 'ルーム作成できるとき' do
      it 'titleが存在すれば作成できる' do
        expect(@room_tag).to be_valid
      end
    end
    context 'ルーム作成できないとき' do
      it 'titleがない' do
        @room_tag.title = ''
        @room_tag.valid?
        expect(@room_tag.errors.full_messages).to include "Title translation missing: ja.activerecord.errors.models.room.attributes.title.blank"
      end
    end
  end
end
