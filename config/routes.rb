Rails.application.routes.draw do
  resources :properties
  resources :users, only: [:create, :destroy]
  resources :sessions, only: [:create, :destroy]
  get '/login_user' , to: 'currents#login_user'
end
