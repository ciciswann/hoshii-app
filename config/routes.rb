Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'sessions' }
  root to: 'sessions#welcome'
  
  resources :users do 
    resources :wishlists
  end

  resources :sessions
  
  # resources :groupbuys do
  #   collection do
  #   end
  # end

  #get 'users/sign_up' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
