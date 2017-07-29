Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: [:new] do
    resources :messages
  end
end
