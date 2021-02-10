require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録出来た' do
      it '全部のフォームに正しく記入し正常にユーザー登録出来た' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録出来ない' do
      it 'ニックネームが空だと登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'パスワードが空だと登録出来ない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワード確認用フォームが未記入だと登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '生年月日が未記入だと登録できない' do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it '名が未記入だと登録できない' do
        @user.real_first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name can't be blank")
      end

      it '姓が未記入だと登録できない' do
        @user.real_family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Real family name can't be blank")
      end
      
      it '名のフリガナが未記入だと登録できない' do
        @user.first_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it '姓のフリガナが未記入だと登録できない' do
        @user.family_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana can't be blank")
      end
      it 'emailが一意性であること' do
        @user.save
        anotheruser = FactoryBot.build(:user, email: @user.email)
        anotheruser.valid?
        expect(anotheruser.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailには@がないと登録できない' do
        @user.email = "aaa.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'パスワードには英数字どちらも含まれていないと登録できない' do
        @user.password = "aaaaAAAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end
      it 'パスワードは６文字未満だと登録できない' do
        @user.password = "a1A"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'パスワード確認用フォームが違うと登録できない' do
        @user.password_confirmation = "aaa333AAA"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名が半角英字だと登録できない' do
        @user.real_first_name = "rikutaro"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name Full-width characters")
      end
      it '名が全角英字だと登録できない' do
        @user.real_first_name = "ｒｉｋｕｔａｒｏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name Full-width characters")
      end
      it '名が半角カタカナだと登録できない' do
        @user.real_first_name = "ﾘｸﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real first name Full-width characters")
      end
      it '姓が半角英字だと登録できない' do
        @user.real_family_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real family name Full-width characters")
      end
      it '姓が全角英字だと登録できない' do
        @user.real_family_name = "ｙａｍａｄａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real family name Full-width characters")
      end
      it '姓が半角カタカナだと登録できない' do
        @user.real_family_name = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Real family name Full-width characters")
      end
      it '名のフリガナが半角英字だと登録できない' do
        @user.first_furigana = "rikutaro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it '名のフリガナが全角英字だと登録できない' do
        @user.first_furigana = "ＲＩＫＵＴＡＲＯ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it '名のフリガナが半角カタカナだと登録できない' do
        @user.first_furigana = "ﾘｸﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it '名のフリガナが漢字だと登録できない' do
        @user.first_furigana = "陸太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it '名のフリガナがひらがなだと登録できない' do
        @user.first_furigana = "りくたろう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana Full-width katakana characters")
      end
      it '姓のフリガナが半角英字だと登録できない' do
        @user.family_furigana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana Full-width katakana characters")
      end
      it '姓のフリガナが全角英字だと登録できない' do
        @user.family_furigana = "ｙａｍａｄａ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana Full-width katakana characters")
      end
      it '姓のフリガナが半角カタカナだと登録できない' do
        @user.family_furigana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana Full-width katakana characters")
      end
      it '姓のフリガナが漢字だと登録できない' do
        @user.family_furigana = "山田"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana Full-width katakana characters")
      end
      it '姓のフリガナがひらがなだと登録できない' do
        @user.family_furigana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family furigana Full-width katakana characters")
      end



    end
  end
end
