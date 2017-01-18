Rails.application.routes.draw do
  # get 'mypages/show'

  devise_for :users
  root to: 'home#index'

  resource :mypage
end
