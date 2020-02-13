Rails.application.routes.draw do
  root 'home#index'
  resources :gossip do 
    resources :likes
    resources :comments
  end
  resources :welcome
  resources :team
  resources :contact
  resources :author
  resources :cities
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
