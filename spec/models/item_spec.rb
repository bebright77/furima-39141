require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品機能' do
    context '出品できる場合' do
      it "商品名と説明、カテゴリー、状態、送料、発送元、発送までの日数、価格が存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end
    context '出品できない場合' do
      it "商品名が空では出品できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "説明が空では出品できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it "カテゴリーは「---」が選択されているときは出品できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end  
      it "商品の状態は「---」が選択されているときは出品できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "送料がは「---」が選択されているときは出品できない" do
        @item.shipping_price_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price can't be blank")
      end
      it "発送元は「---」が選択されているときは出品できない" do
        @item.sender_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender can't be blank")
      end
      it "発送までの日数は「---」が選択されているときは出品できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship can't be blank")
      end
      it "価格が空では出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が300円未満では出品できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "価格が10,000,000では出品できない" do
        @item.price = '100000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "全角では価格が登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "ユーザーが紐づいていないと登録できない" do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
    end
  end
end