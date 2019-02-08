Rails.application.routes.draw do
  resources :potins
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :show, :destroy]
  
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
end
