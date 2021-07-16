Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'

  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:destroy]
  resources :posts, only: [:new, :create, :show, :destroy]
  resources :posts do
    member do
      patch "upvote", to: "posts#upvote"

    end
  end
  resources :comments, only: [:create]
  resources :users do
    resources :relationships, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
