Rails.application.routes.draw do
  resources :properties
  resources :users, only: [:create, :destroy]
end
