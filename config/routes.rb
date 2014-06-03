Mywy::Application.routes.draw do
  mount WeixinRailsMiddleware::Engine, at: "/"
  
  resources :foods, only: [:show, :index] do
    resources :comments
    resources :favorites, :only => [:create, :destroy]
  end

  resources :dinner_tables

  resources :restaurants do
    resources :favorites, :only => [:create, :destroy]
  end

  resources :events

  resources :trailers

  resources :tickets

  resources :cinemas, only: [:show] do
    resources :events
    resources :employments, only: [:index, :show, :create]
    resources :show_times do
      member do
        get :order
      end
    end
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
  
  root 'home#index'

  resources :categories

  resources :orders do
    collection do
      post :alipay_notify
    end
    member do
      post :pay
    end
  end

  resources :carts, :only => [:index]

  resources :line_items

  resources :pictures

  resources :products, :only => [:index, :show] do
    resources :comments
    resources :favorites, :only => [:create, :destroy]
  end

  resources :nodes do
    resources :products, :only => [:index]
  end

  resources :members do
    collection do
      get :check_email
    end
  end

  devise_for :members, :path => "accounts", :controllers => {
    :sessions => :sessions,
    :registrations => :accounts
  }

  namespace :account do
    resources :addresses do
      member do
        get :set_ship_address
      end
    end
  end

  devise_for :admins, :controllers => {
    :sessions => 'admins/sessions',
    :registrations => 'admins/accounts'
  }

  namespace :restaurant do
    resources :waps, only: [:show] do
      resources :foods, only: [:index, :show] do
        collection do
          get :search
        end
      end
    end
  end

  namespace :manage do
    namespace :cinema do
      resources :cinemas do
        resources :wechats do
          resources :waps, only: [:edit, :update]
          resources :wechat_texts
          resources :wechat_articles
          resources :diymenus
          member do
            get :authorize
            get :replyset
            get :focusset
          end
        end
        resources :events
        resources :employments, only: [:index, :update, :destroy]
        resources :movie_halls do
          resources :hall_seats
        end
        resources :show_times
        resources :tickets
      end
    end

    namespace :restaurant do
      resources :restaurants do
        resources :bills do
          member do
            get :checkout
          end
          resources :bill_items
        end
        resources :wechats do
          resources :waps, only: [:edit, :update]
          resources :wechat_texts
          resources :wechat_articles
          resources :diymenus do
            collection do
              get :generate_menu
            end
          end
          member do
            get :authorize
            get :replyset
            get :focusset
          end
        end
        resources :dinner_tables
        resources :events
        resources :employments, only: [:index, :update, :destroy]
        resources :foods do
          resources :images
        end
      end
    end
  end

  namespace :cpanel do
    root :to => "orders#index"

    resources :movies do
      resources :trailers
    end
    resources :cinemas do
      resources :movie_halls do
        resources :hall_seats
      end
      resources :show_times
    end
    resources :members

    resources :orders

    resources :carts

    resources :option_types do
      resources :option_values
    end

    resources :products do
      resources :pictures
      resources :variants
      collection do
        get :search
      end
    end

    resources :nodes do
      resources :products do
        resources :pictures
        resources :natures do
          collection do
            get :forming
          end
        end
      end
      resources :categories do
        collection do
          get :forming
        end
      end
    end
  end
end
