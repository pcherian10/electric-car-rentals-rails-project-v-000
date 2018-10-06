Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signin', to: 'sessions#new'
  post '/sessions/create', to: 'session#create'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  resources :users do
   resources :bookings, only: [:new, :edit, :update, :create, :destroy]
  end

  resources :cars, only: [:index]

  namespace :admin do
    resources :bookings, :only => [:index, :show]
    resources :cars, only: [:new, :create, :edit, :update, :destroy, :show, :index]
    resources :home, only: [:index]
  end



  root 'static_pages#home'

end
