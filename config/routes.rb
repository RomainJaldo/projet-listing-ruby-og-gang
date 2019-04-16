Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root to: 'home#index'
    resources :listings
    namespace :account do
      get 'contacts', only: [:index]
      get 'messages', only: [:index, :create]
      get 'user', only: [:index, :create]
      post 'messages', to: 'messages#create'
    end
  end


end
