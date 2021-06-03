require 'rails_helper'

RSpec.describe OrderResidence, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      @order_residence = FactoryBot.build(:order_residence, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@order_residence).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @order_residence.building = ''
        expect(@order_residence).to be_valid
      end
      it 'phone_numにハイフンが含まれていると保存できる' do
        @order_residence.phone_num = 123-4567-8912
        expect(@order_residence).to be_valid
      end
      it 'phone_numが11桁以下であると保存できる' do
        @order_residence.phone_num = 123-4567-891
        expect(@order_residence).to be_valid
      end

    end

    context '内容に問題がある場合' do
      it 'post_numが空だと保存できない' do
        @order_residence.post_num = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Post num can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_residence.city = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @order_residence.address = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと保存できない' do
        @order_residence.phone_num = ''
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Phone num can't be blank")
      end
      it 'place_idがid=1では保存できない' do
        @order_residence.place_id = 1
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Place can't be blank")
      end
      it 'post_numにハイフンが含まれていないと保存できない' do
        @order_residence.post_num = 1234567
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Post num is invalid")
      end
      it 'phone_numが12桁であると保存できない' do
        @order_residence.post_num = 123456789123
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("Post num is invalid")
      end
      it 'userが紐付いていないと保存できない' do
        @order_residence.user_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_residence.user_id = nil
        @order_residence.valid?
        expect(@order_residence.errors.full_messages).to include("User can't be blank")
      end

      
    end
end
end
