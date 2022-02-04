Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: 'pages#home'

  # Defines the page routes
  ## Login Related
  get "/login", to: "pages#login"
  get "/login/credentials", to: "pages#login_credentials"
  get "/login/submit", to: "pages#login_credentials_submit"

  resources :rooms

end
