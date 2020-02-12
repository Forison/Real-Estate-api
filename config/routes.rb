Rails.application.routes.draw do
  resources :houses
  resources :users, only: [:create, :destroy]
  resources :sessions, only: [:create, :destroy]
  get '/login_user' , to: 'currents#login_user'
  get '/is_user_login' , to: 'currents#is_user_login?'
end
