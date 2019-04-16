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

  namespace :api, format: 'json' do
    namespace :v1 do
      post 'auth', to: 'auth#create'
      get 'locales', to: 'locales#index', as: 'locales'
    end
  end

end
