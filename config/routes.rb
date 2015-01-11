Rails.application.routes.draw do
  root to: "pages#home"

  resources :posts, only: [:show, :index]
  resources :comments

  namespace :admin do
    get '/', to: 'dashboard#home'
    resources :posts
    resources :authors
    resources :categories
    resources :comments, except: [:new, :create, :edit, :update]
  end
end
