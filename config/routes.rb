Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show]
  root 'events#index'
end
