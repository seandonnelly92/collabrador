Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "registrations/registrations"
  }

  root to: "pets#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets do
    resources :appointments, only: [:new, :create]
  end

  resources :appointments, except: [:new] do
    resources :reviews, only: [:create]
  end

  resources :chatrooms, only: show

  get "user_profile", to: "pages#user_profile"
  get '/maps/search', to: 'maps#search', as: 'maps_search'

  # Defines the root path route ("/")
  # root "posts#index"
end
