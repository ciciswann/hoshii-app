Rails.application.routes.draw do
  root to: 'sessions#welcome'
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }
  resources :users do 
    resources :wishlists
  end

  resources :sessions
  
  resources :groupbuys do
    collection do
    end
  end

  #get 'users/sign_up' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
