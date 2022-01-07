require 'rails_helper'

RSpec.describe Page, type: :model do
  before do
    post = FactoryBot.build(:user_post)
    post.save
    @page = FactoryBot.build(:page, post_id: post.id)
  end

  describe "ページの保存" do
    context "保存できる" do
      it '情報が正しく入力されている' do
        expect(@page).to be_valid
      end
    end

    context '保存できない' do
      it 'contentが空である' do
        @page.content = ''
        @page.valid?
        expect(@page.errors.full_messages).to include("Contentを入力してください")
      end
      it 'textが空である' do
        @page.text = ''
        @page.valid?
        expect(@page.errors.full_messages).to include("Textを入力してください")
      end
    end
  end
end
