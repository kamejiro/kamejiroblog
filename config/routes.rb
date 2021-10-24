Rails.application.routes.draw do
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/rules', to: 'static_pages#rules'
  resources :articles, only: [:show]
end
