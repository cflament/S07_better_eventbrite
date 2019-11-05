Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index]
  resources :users, only: [:show]
  root 'events#index'
end
