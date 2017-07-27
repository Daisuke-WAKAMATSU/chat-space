Rails.application.routes.draw do
  # resource :users, only: [:update, :edit]
  devise_for :users
  root 'messages#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
