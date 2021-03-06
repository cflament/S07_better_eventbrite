Rails.application.routes.draw do
  root 'events#index'

  devise_for :users
  
  resources :events do 
    resources :attendances, only: [:new, :create, :destroy, :index]
  end 
  
  resources :users, only: [:show, :edit, :update] do
    resources :profile_pictures, only: [:create, :destroy]
  end
end
