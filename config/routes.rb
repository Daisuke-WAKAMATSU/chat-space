Rails.application.routes.draw do
  devise_for :users
  resources :groups, only: [:new]
  root 'messages#index'
end
