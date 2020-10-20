Rails.application.routes.draw do
  resources :reviews
  resources :stylist_styles
  resources :styles
  resources :appointments
  resources :stylists
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
