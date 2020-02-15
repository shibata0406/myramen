Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'products#index'
  
  resources :users, only: :show do
    member do
      get 'followings'
      get 'followers'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :products, only: [:index, :show, :new, :create, :destroy] do
    resources :reviews, only: [:new, :create, :destroy, :edit, :update]
    collection do
      get 'search'
      get 'search_show'
    end
    
  end
  resources :favorites, only: [:create, :destroy]
  
end
