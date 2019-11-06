Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit, :update]
  resources :attendances, only: [:new, :create]
  root 'events#index'
end
