Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'products#index'
  
  resources :users, only: :show
  resources :products, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:new, :create,]
    collection do
      get 'search'
    end
  end
end
