Rails.application.routes.draw do
  get  '/inquiry', to: 'static_pages#inquiry'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  root to: "products#index"
  resources :products do
    collection do
      get 'products/new/mid_category', to: 'products#mid_category'
    end
  end
end
