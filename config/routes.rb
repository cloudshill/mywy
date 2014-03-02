Mywy::Application.routes.draw do

  resources :cinemas do
    resources :movie_halls do
      resources :hall_seats
    end
    resources :show_times
    resources :tickets
  end

  resources :movies do
    resources :comments
    resources :favorites, :only => [:create, :destroy]
  end
  resources :show_times
  resources :hall_seats
  resources :tickets, :only => [:index, :create]
  resources :favorites, :only => [:index]

  get "home/index"
  get "home/market"
  
  root 'home#index'

  resources :categories

  resources :orders

  resources :carts, :only => [:index]

  resources :line_items

  resources :pictures

  resources :products do
    resources :comments
    resources :favorites, :only => [:create, :destroy]
  end

  resources :nodes do
    resources :products, :only => [:index]
  end

  devise_for :members, :path => "accounts", :controllers => {
    :sessions => :sessions,
    :registrations => :accounts
  }
  devise_scope :member do
  end

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/accounts'
  }

  namespace :cpanel do
    root :to => "orders#index"

    resources :movies
    resources :cinemas do
      resources :movie_halls do
        resources :hall_seats
      end
      resources :show_times
    end
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
