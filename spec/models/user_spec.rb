require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "ニックネーム, メールアドレス, パスワード, パスワード(確認), お名前の性と名,
          お名前カナの性と名, 生年月日が存在すれば登録できる" do
        expect(@user).to be_valid
      end 
    end  

    context '新規登録がうまくいかない時' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it "メールアドレスが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したメールアドレスが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end  
      
      it "パスワードが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "パスワードが5文字以下なら登録できない" do
        @user.password = "0fh9d"
        @user.password_confirmation = "0fh9d"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      
      it "パスワードが存在してもパスワード(確認)が空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "パスワードが半角数字のみなら登録できない" do
        @user.password = "123456" 
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードが半角英語のみなら登録できない" do
        @user.password = "abcdef" 
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "パスワードとパスワード(確認)が一致しないと登録できない" do
        @user.password = "abc4d7e9f"
        @user.password_confirmation = "abc4d7ef9"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "お名前の性が空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      
      it "お名前の名が空だと登録できない" do
        @user.given_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name can't be blank")
      end  

      it "お名前の性が全角でないと登録できない" do
        @user.family_name = "furuta"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end

      it "お名前の名が全角でないと登録できない" do
        @user.given_name = "mayumi"
        @user.valid?
        expect(@user.errors.full_messages).to include("Given name is invalid")
      end

      it "お名前カナの性が空だと登録できない" do
        @user.kana_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      
      it "お名前カナの名が空だと登録できない" do
        @user.kana_given_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana given name can't be blank")
      end
      
      it "お名前カナの性が全角カタカナでないと登録できない" do
        @user.kana_family_name = "かとう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name is invalid")
      end

      it "お名前の性が全角カタカナでないと登録できない" do
        @user.kana_given_name = "くるみ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana given name is invalid")
      end

      it "生年月日が空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end      
end
