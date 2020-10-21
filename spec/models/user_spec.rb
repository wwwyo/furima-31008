require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザーの新規登録' do
    context 'ユーザーの新規登録フォームを正常に行えばば新規登録できる' do
      
    end

    context 'ユーザーの新規登録フォームが異常であれば新規登録できない' do
      it 'ニックネームが空欄' do
      end
      
      it 'メールアドレスが空欄' do
      end

      it 'メールアドレスが既に登録されているものである' do
      end

      it 'メールアドレスに@がない' do
      end

      it 'パスワードが空欄' do 
      end

      it 'パスワードが6文字未満' do
      end

      it 'パスワードが数字のみ' do
      end

      it 'パスワードの確認が空欄' do
      end

      it 'パスワードの確認の値がパスワードと不一致' do
      end

      it '名字が空欄' do
      end

      it '名前が空欄' do
      end

      it '名字(カナ)が空欄' do
      end

      it '名前(カナ)が空欄' do
      end

      it 'ユーザー本名が半角で記入' do
      end

      it 'ユーザー本名(カナ)が全角で記入' do
      end

      it '生年月日が空欄' do
      end
    end
  end
end
