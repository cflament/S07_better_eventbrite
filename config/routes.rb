Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :show] do 
    resources :attendances, only: [:new, :create]
  end 
  resources :users, only: [:show, :edit, :update]
  resources :charges, only: [:new, :create]
  root 'events#index'
end
