Rails.application.routes.draw do


  resources :notifications do
    collection do
      post :mark_as_read
    end
  end
  match "/en" => "pages#index", :via => [:get, :page]
  # Serve websocket cable requests in-process
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  # root to: "pages#index"
  root to: redirect("pages#index", path: '/en?locale=en')
  # map_match.root :controller => 'post#index', :locale => 'en'
  # root :to => redirect('/en')
  mount ActionCable.server, at: '/cable'
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :profiles do
    resources :directories
  end
    resources :posts do
      resources :comments
      resources :likes, only: [:create, :destroy]
    end
    get "/chats" => 'chats#index'
    get "/dashboard" => 'pages#dashboard'
    get "/doctors" => 'pages#doctors'
    get "/patients" => 'pages#patients'
    get "/blogs" => 'pages#blogs'
    get "/about" => 'pages#about'

    resources :users do
      resources :chats, only: [:index, :show, :create]
    end
    resources :messages, only:[:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # error message routes
  get '/internal_server_error', :to => 'errors#internal_server_error'
  get '/not_found', :to => 'errors#not_found'
end
