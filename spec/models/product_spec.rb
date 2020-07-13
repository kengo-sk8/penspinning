require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @user = FactoryBot.create(:user)
  end

  it "FactoryBotの登録内容が正しいこと" do
    user = @user
    expect(user).to be_valid
  end

  # 記事の題名、本文、外部キー（user_id）があれば有効。
  it "コメント、動画、カテゴリー、回し歴、外部キー（user_id）があれば有効であること" do
    user = @user
    product = user.products.build(
      text: "落ちろよおおおおおおおおおおお",
      image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
      category_id: 10,
      pen_history_id: 3,
      user_id: 1
    )
    expect(product).to be_valid
  end

  describe '#create' do #describeは、ネストして作成する事が出来る。「productクラスにあるcreateメソッドをテストするまとまり」であることを示している。
    #describeとdoの間にメソッド名を書く際は#をつけるのが慣習らしい
      #パスワードが6桁の時と５桁の時のテストを行うことで、どの位置からバリデーションが用意されているのか可視化している
    it "テキストの文字量は500以下であること" do
      user = @user
      product = user.products.build(
        text: "a" * 499,
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
      product.valid?
      expect(product).to be_valid
    end


    it "imageがない場合は登録できないこと" do
      product = FactoryBot.build(:product, image: nil)
      product.valid?
      expect(product.errors[:image]).to include("を入力してください")
    end

    it "textがない場合は登録できないこと" do   #it ~ doの間はそのexampleでどんなテストをしているか説明文を記入する
      product = FactoryBot.build(:product, text: nil)
      product.valid? #この記述(valid?)により「バリデーションにより保存ができない状態であるか」を確認する。
      expect(product.errors[:text]).to include("を入力してください")
      #errors ： valid?メソッドを利用したインスタンスに対してerrorsメソッドを利用すると、「バリデーションにより保存ができない状態である場合なぜできないのか」を確認する事が出来る。
      #includeマッチャ : 引数の値(上記の場合は、(:product, name: nil)が引数)がexpectの引数である配列に含まれているかをチェックすることができる。
      #今回の場合、「nameが空の場合は名前を入力してくださいというエラーが出るはずだ」ということがわかっている為、include("を入力してください")のように書く事が出来る。
    end

    it "pen_history_idがない場合は登録できないこと" do
      product = FactoryBot.build(:product, pen_history_id: nil)
      product.valid?
      expect(product.errors[:pen_history_id]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      product = FactoryBot.build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
  end

  describe '#update' do

    it "テキストの文字量は500以下であること" do
      user = @user
      product = user.products.build(
        text: "a" * 499,
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
      product.valid?
      expect(product).to be_valid
    end

    it "imageがない場合は登録できないこと" do
      product = FactoryBot.build(:product, image: nil)
      product.valid?
      expect(product.errors[:image]).to include("を入力してください")
    end

    it "textがない場合は登録できないこと" do
      product = FactoryBot.build(:product, text: nil)
      product.valid?
      expect(product.errors[:text]).to include("を入力してください")
    end

    it "pen_history_idがない場合は登録できないこと" do
      product = FactoryBot.build(:product, pen_history_id: nil)
      product.valid?
      expect(product.errors[:pen_history_id]).to include("を入力してください")
    end

    it "category_idがない場合は登録できないこと" do
      product = FactoryBot.build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end
  end
end



 # include マッチャを使うと、「配列に～が含まれていること」を検証することができます。
 # be_xxx (predicateマッチャ) 戻り値が true / false になるメソッドを be_empty のような形式で検証できる
