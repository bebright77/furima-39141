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
      it "写真が空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
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
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category を選択してください")
      end  
      it "商品の状態は「---」が選択されているときは出品できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition を選択してください")
      end
      it "送料がは「---」が選択されているときは出品できない" do
        @item.shipping_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping price を選択してください")
      end
      it "発送元は「---」が選択されているときは出品できない" do
        @item.sender_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender を選択してください")
      end
      it "発送までの日数は「---」が選択されているときは出品できない" do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to ship を選択してください")
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
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
