Rails.application.routes.draw do
  get 'static_pages/help'
  get 'static_pages/inquiry'
  get  'static_pages/help'
  get  'static_pages/inquiry'
  root to: "products#index"
  resources :products do
  end
end
