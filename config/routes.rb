Rails.application.routes.draw do
  get 'search', to: 'search#index', as: 'browse'
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
  get "feed", to: "pages#feed"
  get "profile", to: "pages#profile"
  get "browse", to: "pages#browse"

  resources :posts do
    resources :comments, except: [:show, :index]
  end

  resources :recipes
  resources :items
  resources :chats, only: [:index, :show, :destroy] do
    resources :messages, only: [:create]
  end
  resources :recipe_items, only: [:new, :create]
  resources :chat_items, only: [:new, :create]
end
