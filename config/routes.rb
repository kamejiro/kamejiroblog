Rails.application.routes.draw do
  get 'categories/show'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rules', to: 'static_pages#rules'
  get '/others', to: 'static_pages#others'
  resources :articles, only: [:show]
  resources :categorys, only: [:show]
end
