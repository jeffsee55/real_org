Rails.application.routes.draw do
  root to: "posts#index"

  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :posts, only: [:show, :index] do
    collection do
      match 'search' => 'posts#search', via: [:get, :post], as: :search
    end
  end
  resources :categories
  resources :messages, only: :create

  namespace :admin do
    get '/', to: 'dashboard#home'
    resources :posts
    resources :authors
    resources :categories
    resources :images
    resources :messages, only: [:index, :show, :destroy]
    resources :stylesheets
    get "contact", to: "pages#contact"
    post "create_image", to: "images#create"
    post "destroy_image", to: "images#destroy"
  end
end
