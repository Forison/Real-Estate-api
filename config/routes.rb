# frozen_string_literal: true

Rails.application.routes.draw do
  resources :houses
  resources :users, only: %i[create destroy]
  resources :sessions, only: %i[create destroy]
  get '/login_user', to: 'currents#login_user'
  get '/is_user_login', to: 'currents#is_user_login?'
end
