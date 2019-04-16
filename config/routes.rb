Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  localized do
    root to: 'home#index'
    resources :listings
    namespace :account do
      resources :contacts, only: [:index]
      resources :messages, only: [:index]
      resources :user, only: [:index, :update]
      post 'messages', to: 'messages#create'
    end
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      post 'auth', to: 'auth#create'
      get 'locales', to: 'locales#index', as: 'locales'
    end
  end

end
