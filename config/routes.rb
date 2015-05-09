Rails.application.routes.draw do
  root to: "pages#home"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  get 'feed' => 'posts#feed'

  resources :posts, only: [:show, :index] do
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end
  resources :categories
  resources :messages, only: [:new, :create]
  resources :subscribers, only: [:create, :destroy]
  get '/subscribers/unsubscribe/:signature' => 'subscribers#unsubscribe', as: 'unsubscribe'

  namespace :admin do
    get '/', to: 'dashboard#home'
    get 'site_posts', to: 'dashboard#site_posts'
    resources :posts do
      collection do
        match 'search' => 'posts#search', via: [:get, :post], as: :search
        get 'site_posts'
      end
      member do
        patch 'publish' => 'posts#update'
        patch 'auto_save' => 'posts#update'
      end
    end
    resources :users
    resources :categories
    resources :images
    resources :messages, only: [:index, :show, :destroy]
    resources :message_options, only: [:new, :show, :create]
    resources :subscribers, only: [:index, :show, :destroy]
    resources :themes, except: [:index]
    resources :menus
    get "contact", to: "pages#contact"
    patch 'auto_update_post' => 'posts#auto_update'
    patch 'clear_auto_saved_post' => 'posts#clear_auto_saved_post'
    post "create_image", to: "images#create"
    post "destroy_image", to: "images#destroy"
  end
end
