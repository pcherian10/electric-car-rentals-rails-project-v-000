Rails.application.routes.draw do
  get 'signin', to: 'sessions#new'
  post '/sessions/create', to: 'session#create'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'car_count', to: 'cars#car_count'
  get 'ajax_booking', to: 'bookings#ajax_booking'
  get 'ajax_edit_booking', to: 'bookings#ajax_edit_booking'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :users do
   resources :bookings
  end

  resources :cars, only: [:index, :show]

  namespace :admin do
    resources :bookings, :only => [:index, :show]
    resources :cars, only: [:new, :create, :edit, :update, :destroy, :show, :index]
    resources :home, only: [:index]
  end

  root 'static_pages#home'

end
