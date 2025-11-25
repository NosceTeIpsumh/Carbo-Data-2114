Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#feed", as: "feed"
  get "home", to: "pages#home"
  get "profile", to: "pages#profile"
  get 'search', to: 'search#index', as: 'browse'

  resources :posts do
    resources :comments, except: [:show, :index]
  end

  resources :recipes
  resources :items, except:[:new]
  resources :chats, only: [:index, :show, :destroy] do
    resources :messages, only: [:create] do
      member do
        post :save_recipe
      end
    end
  end
  resources :recipe_items, only: [:new, :create]
  resources :chat_items, only: [:new, :create]
end
