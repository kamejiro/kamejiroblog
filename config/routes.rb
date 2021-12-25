Rails.application.routes.draw do
  get 'categories/show'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rules', to: 'static_pages#rules'
  get '/others', to: 'static_pages#others'
  get '/new', to: 'articles#new'
  post '/create', to: 'articles#create'
  resources :articles, only: [:show, :create, :destroy]
  resources :categorys, only: [:show]
end
