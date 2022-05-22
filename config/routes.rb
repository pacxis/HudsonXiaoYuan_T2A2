Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'listings#index'
  resources :listings
  
  get 'bookings', to: 'bookings#index', as: 'bookings'
  get 'bookings/:id', to: 'bookings#show', as: 'booking'
  get 'bookings/:id/edit', to: 'bookings#edit', as: 'edit_booking'
  patch 'bookings/:id/edit', to: 'bookings#update'
  put 'bookings/:id', to: 'bookings#update'
  delete 'bookings/:id', to: 'bookings#destroy'

  get 'listings/:id/book', to: 'bookings#new', as: 'new_booking'
  get 'listings/:id/bookings', to: 'bookings#seebookings'
  post 'listings/:id/book', to: 'bookings#create'
  get 'listings/:id/new_menu', to: 'menus#new', as: 'new_menu'
  post 'listings/:id/', to: 'menus#create'




end
