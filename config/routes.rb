Rails.application.routes.draw do
  get 'categories/show'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rules', to: 'static_pages#rules'
  get '/contact', to: 'static_pages#contact'
  get '/others', to: 'static_pages#others'
  get '/new', to: 'articles#new'
  get '/signup', to: 'users#signup'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/search', to: 'articles#search'
  get '/upload', to: 'images#new'

  resources :articles, only: [:show, :create, :destroy, :index, :edit, :update]
  resources :categorys, only: [:show]
  resources :users, only: [:create, :destroy, :index, :edit, :update]
  resources :images, only: [:create, :destroy, :index]
end
