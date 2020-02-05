Rails.application.routes.draw do
  resources :properties
  resources :users, only: [:create, :destroy]
  resources :sessions, only: [:create, :destroy]
end
