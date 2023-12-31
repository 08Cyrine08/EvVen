Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "profile", to: "pages#profile"

  resources :reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :venues do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[new create]
    resources :tags, only: %i[new create]
  end

  resources :reviews, only: :destroy
  resources :tags, only: :destroy
  resources :bookings, only: :destroy
end
# Defines the root path route ("/")
# root "articles#index"
