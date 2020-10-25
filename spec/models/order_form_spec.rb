require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe '商品購入機能' do
    context 'クレジットカード情報、配達先の情報を正しく入力すると商品を購入できる' do
      it '全ての情報を正しく入力' do

      end

      it '建物名が空欄' do

      end
    end

    context 'クレジットカードの情報、配送先の情報を異常に入力すると商品を購入できない' do
      it '郵便番号が空欄' do
        
      end

      it '郵便番号にハイフンがない' do
        
      end
      
      it '都道府県を選択していない' do
        
      end
      
      it '市区町村が空欄' do

      end

      it '番地が空欄' do
        
      end

      it '電話番号が空欄' do
        
      end

      it '電話番号にハイフンがある' do
        
      end

      it '電話番号が12桁以上である' do
        
      end

      it 'トークンを受け取っていない' do
        
      end
    end
    
  end
end
