require 'rails_helper'

RSpec.describe Tag, type: :model do
  before do
    @tag = FactoryBot.build(:tag)
  end

  describe 'タグ機能' do
    context 'タグが作成できる' do
      it 'nameが存在する' do
        expect(@tag).to be_valid
      end
    end
    context 'タグが作成できない' do
      it 'nameがない' do
        @tag.name = ''
        @tag.valid?
        expect(@tag.errors.full_messages).to include
      end
      it '重複したnameが存在する場合作成できない' do
        @tag.save
        another_tag = FactoryBot.build(:tag)
        another_tag.name = @tag.name
        another_tag.valid?
        expect(another_tag.errors.full_messages).to include
      end
    end
  end
end
