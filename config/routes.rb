Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root to: 'home#index'
    resources :listings
    namespace :account do
      # get 'contacts', on: :collection
      # get 'messages', on: :collection
      # get 'user', on: :collection
      post 'messages', to: 'messages#create'
    end
  end


end
