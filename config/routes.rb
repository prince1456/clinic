Rails.application.routes.draw do
  devise_for :users
  resources :profiles


  root "pages#index"
  resources :posts do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
