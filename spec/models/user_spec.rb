require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '登録ができる' do
      it '正しく情報を入力している' do
        expect(@user).to be_valid
      end
    end

    context '登録できない' do
      it 'nameが空である' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'emailが空である' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@が入っていない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'emailが登録されている' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空である' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordとpassword_confirmationが一致しない' do
        @user.password = 'asdf1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'passwordが6文字より短い' do
        @user.password = 'test1'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
    end
  end
end
