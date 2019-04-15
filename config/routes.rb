Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root to: 'home#index'
    resources :listings
    #get 'home', to: 'home#index

    root to: 'account#index'
    resources :account
  end

  # root to: 'listings#index'
  # resources :listings, only: [:index]

end
