Rails.application.routes.draw do
  resources :reviews
  resources :stylist_styles
  resources :styles
  resources :appointments
  resources :stylists
  resources :users

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'

  post '/sessions/new_login', to: 'sessions#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
