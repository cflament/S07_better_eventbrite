Rails.application.routes.draw do
  devise_for :users
  resources :events do 
    resources :attendances, only: [:new, :create, :destroy, :index]
  end 
  resources :users, only: [:show, :edit, :update]
  root 'events#index'
end
