require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの保存' do
    context '保存できる' do
      it 'messageが空ではない' do
        expect(@message).to be_valid
      end
    end

    context '保存できない' do
      it 'messageが空である' do
        @message.message = ''
        @message.valid?
        expect(@message.errors.full_messages).to include('Messageを入力してください')
      end
    end
  end
end
