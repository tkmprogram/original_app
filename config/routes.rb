Rails.application.routes.draw do
  devise_for :users
  root to: 'shoes#index'
  resources :shoes 
end
