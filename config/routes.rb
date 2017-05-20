Rails.application.routes.draw do
  devise_for :users
  resources :profiles

  # Serve websocket cable requests in-process
    mount ActionCable.server => '/cable'

  root "pages#index"
  resources :posts do

    resources :comments
    resources :likes, only: [:create, :destroy]
  end

get "/chats" => 'chats#index'
  resources :users do
   resources :chats, only: [:index, :show, :create]
  end
    resources :messages, only:[:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
