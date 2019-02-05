Rails.application.routes.draw do
  get 'potin/:id', to: 'dynamic_pages#potin', as: 'potin'
  get 'user/:id', to: 'dynamic_pages#user', as: 'user'
  get '/', to: 'static_pages#index', as: 'index'
  get '/connection', to: 'static_pages#connection', as: 'connection'
  get '/team', to: 'static_pages#team', as: 'team'
  get '/contact', to: 'static_pages#contact', as: 'contact'
  get '/welcome', to: 'static_pages#welcome', as: 'welcome'
end
