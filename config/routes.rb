Rails.application.routes.draw do
  get 'categories/show'
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rules', to: 'static_pages#rules'
  get '/others', to: 'static_pages#others'
  get '/new', to: 'articles#new'
  get '/signup', to: 'users#signup'
  post '/create', to: 'articles#create'
  resources :articles, only: [:show, :create, :destroy, :index]
  resources :categorys, only: [:show]
  resources :users, only: [:create, :destroy, :index, :edit, :update]
end
