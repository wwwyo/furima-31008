require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe '商品購入機能' do
    context 'クレジットカード情報、配達先の情報を正しく入力すると商品を購入できる' do
      it '全ての情報を正しく入力' do
        expect(@order_form).to be_valid
      end

      it '建物名が空欄' do
        @order_form.delivery_building = ""
        expect(@order_form).to be_valid
      end
    end

    context 'クレジットカードの情報、配送先の情報を異常に入力すると商品を購入できない' do
      it '郵便番号が空欄' do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号にハイフンがない' do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      
      it '都道府県を選択していない' do
        @order_form.delivery_prefecture_id = "1"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery prefecture must be other than 1")
      end
      
      it '市区町村が空欄' do
        @order_form.delivery_town = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery town can't be blank")
      end

      it '番地が空欄' do
        @order_form.delivery_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery number can't be blank")
      end

      it '電話番号が空欄' do
        @order_form.phon_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phon number can't be blank")
      end

      it '電話番号にハイフンがある' do
        @order_form.phon_number = "080-1234-1234"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phon number is invalid")
      end

      it '電話番号が12桁以上である' do
        @order_form.phon_number = "1234546789101"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phon number is invalid")
      end

      it 'トークンを受け取っていない' do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
    end
  end
end
