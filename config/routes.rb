Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  get "/logout" to: "sessions#destroy"
  delete "/sessions/destroy", to: "sessions#destroy"
  post "/bookings/new", to: "bookings#new"
  resources :cars
  resources :users
end
