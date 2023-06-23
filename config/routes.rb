Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
  end
  resources :reviews, only: :destroy
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
  end
  # Defines the root path route ("/")
  # root "articles#index"
