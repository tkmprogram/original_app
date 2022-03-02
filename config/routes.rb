Rails.application.routes.draw do
  devise_for :users
  root to: 'shoes#index'
  resources :shoes do
    collection do
      get 'search'
    end
  end

end
