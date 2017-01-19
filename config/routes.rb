Rails.application.routes.draw do

  

  resources :places
  # get 'mypages/show'

  devise_for :users
  root to: 'users#index'

  
  resources :users, only: [:show, :index]

end
