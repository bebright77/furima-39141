require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    sleep(1)
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  context '配送先情報に問題ない場合' do
    it "郵便番号、都道府県、市区町村、番地、電話番号、tokenがあれば保存ができること" do
      expect(@order_address).to be_valid
    end

    it "建物名が空でも保存ができる" do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it "建物名が入力されても保存ができる" do
      @order_address.building = "アパート名"
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "郵便番号が空では保存ができないこと" do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code が無効です。ハイフンを入れてください")
    end

    it "郵便番号がハイフンなしでは保存ができないこと" do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code が無効です。ハイフンを入れてください")
    end

    it "郵便番号は前半が3桁でなければ保存ができないこと" do
      @order_address.postal_code = "1234-4567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code が無効です。ハイフンを入れてください")
    end

    it "郵便番号は後半が4桁でなければ保存ができないこと" do
      @order_address.postal_code = "123-45678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code が無効です。ハイフンを入れてください")
    end

    it "都道府県が「---」が選択されているときは保存ができないこと" do
      @order_address.sender_id = 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Sender を選択してください")
    end

    it "市区町村が空では保存ができないこと" do
      @order_address.municipality = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end

    it "番地が空では保存ができないこと" do
      @order_address.address = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it "電話番号が空では保存ができないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が9桁以下では購入できないこと' do
      @order_address.phone_number = '123456789'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it '電話番号は、12桁以上では購入できないこと' do
      @order_address.phone_number = '123456789012'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end
    
    it 'userが紐付いていなければ購入できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
