Rails.application.routes.draw do
  root to: "pages#home"

  get "about", to: "pages#about"

  resources :posts, only: [:show, :index]
  resources :categories

  namespace :admin do
    get '/', to: 'dashboard#home'
    resources :posts
    resources :authors
    resources :categories
  end
end
