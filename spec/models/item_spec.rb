require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    # user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
   end

   describe "商品出品情報の保存" do
    context '商品出品情報が保存できるとき' do
      it "項目は全て記入されていれば保存される" do
        expect(@item).to be_valid
      end
      it "販売価格が¥300~¥9,999,999の間であれば保存される" do
        @item.price >= 300 && @item.price <= 9999999
        expect(@item).to be_valid
      end
      it "販売価格は半角数字のみ保存される" do
        @item.price = '123123'
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が保存できないとき' do
      it "items_nameが空では保存できない" do
        @item.items_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items name can't be blank")  
      end
      it "items_aboutが空では保存できない" do
        @item.items_about = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Items about can't be blank")  
      end
      it "priceが空では保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")  
      end
      it "imageが空では保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")  
      end
      it "category_idがid=1では保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")  
      end
      it "day_idがid=1では保存できない" do
        @item.day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")  
      end
      it "place_idがid=1では保存できない" do
        @item.place_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Place must be other than 1")  
      end
      it "shipping_idがid=1では保存できない" do
        @item.shipping_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 1")  
      end
      it "status_idがid=1では保存できない" do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")  
      end
      it "販売価格が¥300以下では保存されない" do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")  
      end
      it "販売価格が¥9,999,999以上では保存されない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "販売価格は全角数字では保存されない" do
        @item.price = '３２１'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")  
      end
    end
  end
end

