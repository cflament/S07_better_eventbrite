Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :new, :create, :edit, :delete, :show] do 
    resources :attendances, only: [:new, :create, :index]
  end 
  resources :users, only: [:show, :edit, :update]
  root 'events#index'
end
