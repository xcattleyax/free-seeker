require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    post = FactoryBot.build(:user_post)
    post.save
    @comment = FactoryBot.build(:comment, post_id: post.id)
  end

  describe "コメントの保存" do
    context "保存できる" do
      it "コメントが入力されている" do
        expect(@comment).to be_valid
      end
    end

    context "保存できない" do
      it "コメントが入力されていない" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Commentを入力してください")
      end
    end
  end
end
