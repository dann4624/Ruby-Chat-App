Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'rooms#index'

  ## Login Related
  ### Email / Password Related
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  ### Alternative Future Login Methods
  get '/facebook', to: 'sessions#facebook'
  get '/google', to: 'sessions#facebook'
  
  ## Setup Resource Routes
  resources :users
  resources :rooms do
    resources :messages
  end
end
