require 'rails_helper'

 RSpec.describe User, type: :model do
   before do
    @user = FactoryBot.build(:user)
   end

   describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上の半角英数字混合であれば登録できる' do
        @user.password = '000aaa'
        @user.password_confirmation = '000aaa'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
     it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "emailが一意性でないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it "emailに＠が含まれていないと登録できない" do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
     end
     it "passwordが空だと登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordとpassword_confirmationが5文字以下では登録できない" do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
     it "passwordは半角英数字混合での入力でないと登録できない(英字のみ)" do
      @user.password = 'asdzxc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordは半角英数字混合での入力でないと登録できない(数字のみ)" do
      @user.password = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
     end
     it "passwordかpassword_confirmationのどちらか空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "psswordは全角では登録できないこと" do
      @user.password = 'ＡＡＡ０００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
     end
     it "passwordとpassword_confirmationが一致してないと登録できない" do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it "last_nameが空だと登録できない" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_nameが空だと登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "last_nameが全角入力でないと登録できない" do
      @user.last_name = 'hoge'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
     end
     it "first_nameが全角入力でないと登録できない" do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
     end
     it "last_name_detailが空だと登録できない" do
      @user.last_name_detail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name detail can't be blank")
     end
     it "first_name_detailが空だと登録できない" do
      @user.first_name_detail = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name detail can't be blank")
     end
     it "last_name_detailが全角入力でないと登録できない" do
      @user.last_name_detail = 'あああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name detail is invalid')
     end
     it "first_name_detailが全角入力でないと登録できない" do
      @user.first_name_detail = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name detail is invalid')
     end
     it "birth_dayが空だと登録できない" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
     end

   end
 end
end
