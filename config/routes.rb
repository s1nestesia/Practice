Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'home#index'

  resources :posts do
    resources :likes, only: [:create, :destroy, :index]
  end

  resources :users, only: [:show, :edit, :update]

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

  resources :relationships, only: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
