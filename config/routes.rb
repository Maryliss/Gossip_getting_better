Rails.application.routes.draw do
  resources :potins
  resources :users
  resources :cities
  
  get 'potin/:id', to: 'dynamic_pages#potin'
  get 'user/:id', to: 'dynamic_pages#user'
  get '/', to: 'static_pages#index'
  get '/connection', to: 'static_pages#connection'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/welcome', to: 'static_pages#welcome'
end
