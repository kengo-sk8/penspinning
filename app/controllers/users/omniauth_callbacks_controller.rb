class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    authorization
  end

  def failure
    redirect_to root_path
  end

  private

  def authorization
    sns_info = User.from_omniauth(request.env["omniauth.auth"])
    @user = sns_info[:user]
      #APIから受け取ったレスポンスがrequest.env["omniauth.auth"]という変数に入っている
      #DB操作を行うメソッドUser.from_omniauthを仮で作り、上記変数を渡す
      #Userモデルのインスタンスを返させて＠userへ代入することで、その後の処理でdeviseのヘルパーを利用することができる


    if @user.persisted? #ユーザー情報が登録済みなので、新規登録ではなくログイン処理を行う
      sign_in_and_redirect @user, event: :authentication
    else #ユーザー情報が未登録なので、新規登録画面へ遷移する
      @sns_id = sns_info[:sns].id
      render template: 'devise/registrations/new'
    end
  end
end
