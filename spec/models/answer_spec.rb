require 'rails_helper'

RSpec.describe Answer, type: :model do
  before do
    post = FactoryBot.build(:user_post)
    post.save
    @answer = FactoryBot.build(:answer, post_id: post.id)
  end

  describe "answerの保存" do
    context "保存できる" do
      it "情報が正しく入力されている" do
        expect(@answer).to be_valid
      end
    end

    context "保存できない" do
      it "questionが入力されていないと保存できない" do
        @answer.question = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("質問内容を入力してください")
      end
      it "answerが入力されていないと保存できない" do
        @answer.answer = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("回答内容を入力してください")
      end
    end
  end
end
