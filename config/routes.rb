Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'rooms#index'
  # Defines the page routes
  ## Login Related
  get "/login", to: "pages#login"
  get "/login/credentials", to: "pages#login_credentials"
  get "/login/submit", to: "pages#login_credentials_submit"

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  get '/facebook', to: 'sessions#facebook'
  get '/google', to: 'sessions#facebook'
  
  resources :users
  resources :rooms do
    resources :messages
  end

end
