Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create] 
    collection do
      get 'search'
      get 'about'
      get 'research'
    end
  end
  # get 'items/about'
  # get 'items/search'
end
