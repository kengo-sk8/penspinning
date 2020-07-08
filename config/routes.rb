Rails.application.routes.draw do
  get 'static_pages/about'
  get 'static_pages/inquiry'
  get 'static_pages/contact'
  root to: "products#index"
  resources :products do
  end
end
