require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'lastname, firstname, furigana_lastname, furigana_firstname, email,
      password, password_confirmation, nicknameとbirthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = '123456a'
        @user.password_confirmation = '123456a'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '姓に全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.lastname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end

      it '名に全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
        @user.firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end

      it '姓にフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.furigana_lastname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana lastname is invalid")
      end

      it '名にフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.furigana_firstname = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana firstname is invalid")
      end

      it 'メールアドレスは@を含む必要があること' do
        @user = FactoryBot.build(:user, email: 'kengmail.com')
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid", "Email is invalid")
      end

      it 'パスワードは数字のみを入力する場合登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードは確認用を含めて2回入力すること' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'lastnameが空では登録できないこと' do
        @user.lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank", 'Lastname is invalid')
      end
      it 'firstnameが空では登録できないこと' do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", 'Firstname is invalid')
      end
      it 'furigana_lastnameが空では登録できないこと' do
        @user.furigana_lastname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana lastname can't be blank", 'Furigana lastname is invalid')
      end
      it 'furigana_firstnameが空では登録できないこと' do
        @user.furigana_firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Furigana firstname can't be blank", 'Furigana firstname is invalid')
      end
      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '123457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
