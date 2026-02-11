Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "pages#root"
  get "home", to: "pages#home"
  get "feed", to: "pages#feed"
  get "profile", to: "pages#profile"

  resources :posts do
    resources :comments, except: [:show, :index] do
      resource :vote, only: [:create]
    end
    resource :vote, only: [:create]
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
