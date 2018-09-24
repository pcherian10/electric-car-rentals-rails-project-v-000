Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/signin", to: "sessions#new"
  #post "/sessions/create" to: "sessions#create"
  root 'static_pages#home'

  resources :users, only: [:show] do
    resources :bookings, only: [:show, :index]
  end

  resources :users
end
