Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'listings#index'

  resources :listings

  get 'listings/:id/new_menu', to: 'menus#new', as: 'new_menu'
  post 'listings/:id/', to: 'menus#create'



end
