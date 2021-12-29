require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
  end

  describe 'グループ作成' do
    context '作成できる' do
      it '全ての情報が入力されている' do
        expect(@group).to be_valid
      end
      it 'contentが入力されていない' do
        @group.content = ''
        expect(@group).to be_valid
      end
    end

    context '作成できない' do
      it 'nameが入力されていない' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include('名前を入力してください')
      end
    end
  end
end
