Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  } #ゲストログイン消去&編集防止
  devise_scope :user do #ゲストログイン機能
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: "products#index"

  resources :users, only: :show
  resources :products do
    collection do
      get 'products/new/mid_category', to: 'products#mid_category'
    end
  end

  get  '/inquiry', to: 'static_pages#inquiry'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

end
