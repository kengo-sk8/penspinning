require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before do
    @user = FactoryBot.create(:user)
  end

  it "FactoryBotの登録内容が正しいこと" do
    user = @user
    expect(user).to be_valid
  end


  describe '#show' do
    it "コメントがない場合、投稿できないこと" do
      comment = FactoryBot.build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
    it "コメントの文字数が250以上だと書けないこと" do
      comment = FactoryBot.build(:comment, text: "a" * 251)
      comment.valid?
      expect(comment).to be_invalid
    end
  end
end
