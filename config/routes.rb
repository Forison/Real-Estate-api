# frozen_string_literal: true

Rails.application.routes.draw do
  resources :favorites, only: %i[index create]
  resources :sellers, only: %i[index show]
  resources :houses
  resources :users, only: %i[create destroy]
  resources :sessions, only: %i[create destroy]
  get '/login_user', to: 'currents#login_user'
  get '/is_user_login', to: 'currents#is_user_login?'
  get '/user_id', to: 'currents#user_id'
  get 'category/:category', to: 'currents#categorize'
  get '/user_homes', to: 'currents#user_homes'
  get '/uploader_homes/:id', to: 'currents#user_homes'
  resources :alerts, only: %i[create]
end
