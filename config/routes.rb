Rails.application.routes.draw do
  root to: "pages#home"

  get "about", to: "pages#about"

  resources :posts, only: [:show, :index]
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
    post "create_image", to: "images#create"
    post "destroy_image", to: "images#destroy"
  end
end
