Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, except: [:show, :destroy] do
    resources :messages, only: [:create]
  end
end
