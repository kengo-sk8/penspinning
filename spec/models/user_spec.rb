require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#create' do
    it "nameがない場合は登録できないこと" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end
    it "emailがない場合は登録できないこと" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end
    it "password_confirmationがない場合は登録できないこと" do
      user = FactoryBot.build(:user, password_confirmation: nil)
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    it "@が最初にくると登録できないこと" do
      user = FactoryBot.build(:user, email: "@aaa")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "@が最後に来ると登録できないこと" do
      user = FactoryBot.build(:user, email: "aaaa@")
      user.valid?
      expect(user.errors[:email][0]).to include("は不正な値です")
    end
    it "パスワード数字のみは登録できないこと" do
      user = FactoryBot.build(:user, password: "1111111111",)
      user.valid?
      expect(user).to be_invalid
    end
    it "パスワード英字のみは登録できないこと" do
      user = FactoryBot.build(:user, password: "aaaaaaa")
      user.valid?
      expect(user).to be_invalid
    end
    it "パスワードが暗号化されているか" do
      user = FactoryBot.create(:user)
      expect(user.password).to_not eq "password"
    end
    it "password_confirmationとpasswordが異なる場合保存できない" do
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
    end
  end
end
