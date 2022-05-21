Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'listings#index'
  resources :listings
  
  get 'bookings', to: 'bookings#index', as: 'bookings'
  get 'seller_bookings', to: 'bookings#seller_index', as: 'seller_bookings'
  get 'listings/:id/book', to: 'bookings#new', as: 'new_booking'
  post 'listings/:id/book', to: 'bookings#create'
  


  get 'listings/:id/new_menu', to: 'menus#new', as: 'new_menu'
  post 'listings/:id/', to: 'menus#create'




end
