Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :home, only: [:index]
  #get 'home', to: 'home#index'

  root to: 'listings#index'
  resources :listing, only: [:index]  

end
