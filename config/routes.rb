Rails.application.routes.draw do
  devise_for :users
  resources :profiles


  root "pages#index"
  resources :posts do
<<<<<<< HEAD
    resources :comments 
=======
    resources :comments
    resources :likes, only: [:create, :destroy]
>>>>>>> 38fa8420c84a4feeeabe8f8336d6ee9ccca9bc8b
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
