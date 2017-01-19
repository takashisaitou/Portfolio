Rails.application.routes.draw do

  resources :places
  devise_for :users
  resources :gardens
  resources :users, only: [:show, :index]
  root to: 'users#index'

end
