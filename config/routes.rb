Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks', sessions: 'users/sessions'}
  root to: 'groupbuys#welcome'
  
  resources :users do 
    resources :wishlists
  end
  
  # resources :groupbuys do
  #   collection do
  #   end
  # end

  #get 'users/sign_up' 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
