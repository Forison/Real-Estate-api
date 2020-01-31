Rails.application.routes.draw do
  root 'v1/properties#index'
  devise_for :users
  namespace :v1 do 
    resources :properties
  end
end
