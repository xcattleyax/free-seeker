require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:user_post)
    @group_post = FactoryBot.build(:group_post)
  end

  describe 'postを保存する' do
    context '保存できる' do
      it 'ユーザーで保存できる' do
        expect(@post).to be_valid
      end
      it 'グループで保存できる' do
        expect(@group_post).to be_valid
      end
    end

    context '保存できない' do
      it 'titleが入力されていない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Titleを入力してください')
      end
    end
  end
end
