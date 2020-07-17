require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#show' do
    it "コメントがない場合、投稿できないこと" do
      comment = FactoryBot.build(:comment, text: nil)
      comment.valid?
      expect(comment.errors[:text]).to include("を入力してください")
    end
    it "コメントの文字数が250以内で" do
      comment = FactoryBot.build(:comment, text: "a" * 251)
      comment.valid?
      expect(comment).to be_invalid
    end




  end
end
