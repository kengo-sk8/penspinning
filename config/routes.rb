Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  } #ゲストログイン消去&編集防止
  devise_scope :user do #ゲストログイン機能
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "products#index"

  resources :users, only: :show #マイページ
  resources :products do
    resources :comments, only: [:create, :destroy, :show, :index] #productコントローラのindexとshowにコメントのidを渡す為、:show, :indexを追加した
    collection do  # ↓カテゴリー機能
      get 'products/new/mid_category', to: 'products#mid_category'
    end
  end
  post   '/like/:product_id' => 'likes#like',   as: 'like'
  delete '/like/:product_id' => 'likes#unlike', as: 'unlike'

  get  '/inquiry', to: 'static_pages#inquiry'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

end
