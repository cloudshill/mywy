Mywy::Application.routes.draw do

  get "home/index"
  
  root 'home#index'

  resources :favorites, :only => [:create, :destroy]

  resources :categories

  resources :orders

  resources :carts, :only => [:index]

  resources :line_items

  resources :pictures

  resources :products do
    resources :comments
  end

  resources :nodes

  devise_for :members, :path => "accounts", :controllers => {
    :sessions => :sessions,
    :registrations => :accounts
  }
  devise_scope :member do
    get 'accounts/favorites'      =>    'accounts#favorites',        :as => :favorites_accounts
  end

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/accounts'
  }

  namespace :cpanel do
    root :to => "orders#index"

    resources :members

    resources :orders

    resources :carts

    resources :nodes do
      resources :products do
        resources :pictures
      end
      resources :categories do
        collection do
          get :forming
        end
      end
    end
  end
end
