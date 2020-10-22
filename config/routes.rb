Rails.application.routes.draw do
  
  get '/', to: 'styles#index', as: 'root'

  resources :reviews
  resources :stylist_styles
  resources :styles
  resources :appointments
  resources :stylists
  resources :users

  delete '/sessions/logout', to: 'sessions#logout', as: 'logout'

  get '/sessions/new_login', to: 'sessions#new_login', as: 'new_login'

  post '/sessions/new_login', to: 'sessions#login'

  get '/sessions/stylist_new_login', to: 'sessions#stylist_new_login', as: 'stylist_new_login'

  post '/sessions/stylist_new_login', to: 'sessions#stylist_login'

  delete '/sessions/stylist_logout', to: 'sessions#stylist_logout', as: 'stylist_logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
