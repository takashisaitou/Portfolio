Rails.application.routes.draw do


  # get "/search" => "places#search"
  resources :places
  devise_for :users
  resources :gardens
  resources :posts
  resources :users, only: [:show, :index, :edit, :update]
  root to: 'home#top'
end
