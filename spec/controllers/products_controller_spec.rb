require 'rails_helper'
#一番下にrspecの用語の意味を記載してある
RSpec.describe ProductsController, type: :controller do

  describe "#index" do
    # 正常なレスポンスか？
    it "indexの画面が正常に開くこと" do
      get :index
      expect(response).to be_successful
    end
    # 200レスポンスが返ってきているか？
    it "indexの画面に遷移後、200レスポンスが返ってくること" do
      get :index
      expect(response).to have_http_status "200"
      # have_http_status "200"は、リクエストが成功したことを示す
    end
  end

  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @product = @user.products.create(
        title: "tadashi",
        text: "落ちろよおおおおおおおおおおお",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
    end
      # 正常なレスポンスか？
    it "showの画面が正常に開くこと" do
      get :show, params: {id: @product.id}
      expect(response).to be_successful
    end
    it "showの画面に遷移後、200レスポンスが返ってくること" do
      get :show, params: {id: @product.id}
      expect(response).to have_http_status "200"
    end
  end

  describe "#new" do
    before do
      @user = FactoryBot.create(:user)
      @product = @user.products.create(
        title: "tadashi",
        text: "落ちろよおおおおおおおおおおお",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
    end
    context "ログインユーザーの確認テスト" do
      # 正常なレスポンスか？
      it "ログインしたユーザーのみnewの画面を正常に開くこと" do
        get :new
        expect(response).to be_successful
      end
      # 200レスポンスが返ってきているか？
      it "ログインしたユーザーのみ200レスポンスが返ってくること" do

        get :new
        expect(response).to have_http_status "200"
      end
    end
  end

  describe "#edit" do
    before do
      @user = FactoryBot.create(:user)
      @product = @user.products.create(
        title: "tadashi",
        text: "落ちろよおおおおおおおおおおお",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
    end
    # 正常なレスポンスか？
    it "edirの画面が正常に開くこと" do
      get :edit, params: {id: @product.id}
      expect(response).to be_successful
    end
    # 200レスポンスが返ってきているか？
    it "ediの画面に遷移後、200レスポンスが返ってくること" do
      get :edit, params: {id: @product.id}
      expect(response).to have_http_status "200"
    end
  end
  describe "#destroy" do
    before do
      @user = FactoryBot.create(:user)
      @product = @user.products.create(
        title: "tadashi",
        text: "落ちろよおおおおおおおおおおお",
        image: Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test.jpg')),
        category_id: 10,
        pen_history_id: 3,
        user_id: 1
      )
    end
    context "ログインしたユーザーのみが自分の投稿を消去できる" do
      # 正常に記事を削除できるか？
      it "deletes an products" do
        expect {
          delete :destroy, params: {id: @product.id}
        }.to change(@user.products, :count).by(-1)
      end
      # 記事を削除した後、ルートページへリダイレクトしているか？
      it "destoryの画面に遷移後、200レスポンスが返ってくること" do
        delete :destroy, params: {id: @product.id}
        expect(response).to have_http_status "200"
      end
    end
  end
end











# expect には「期待する」という意味。要は、結果としてそうなる事を期待してる言う意味
# toは「～であること」を期待する場合に使う
# not_to もしくは to_not は「～ではないこと」を期待する場合は使う
# eq 期待値と実際の値が「等しい」かどうかを検証する場合に使用する
# be は等号・不等号と組み合わせて、値の大小を検証するとき使用する
# be_〇〇 戻り値が true / false になるメソッドをbe_〇〇の形式で検証することができる
