Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#home"
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
