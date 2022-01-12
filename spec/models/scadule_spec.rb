require 'rails_helper'

RSpec.describe Scadule, type: :model do
  before do
    @scadule = FactoryBot.build(:scadule)
  end

  describe 'スケジュールの保存' do
    context '保存できる' do
      it '情報が正しく入力されている' do
        expect(@scadule).to be_valid
      end
    end
    
    context '保存できない' do
      it 'dateが入力されていない' do
        @scadule.date = ""
        @scadule.valid?
        expect(@scadule.errors.full_messages).to include("日付を入力してください")
      end
      it 'contentが入力されていない' do
        @scadule.content = ""
        @scadule.valid?
        expect(@scadule.errors.full_messages).to include("企画名を入力してください")
      end
      it 'textが入力されていない' do
        @scadule.text = ""
        @scadule.valid?
        expect(@scadule.errors.full_messages).to include("内容を入力してください")
      end
    end
  end
end
