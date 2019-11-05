Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create]
  resources :users, only: [:show]
  root 'events#index'
end
