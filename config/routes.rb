Rails.application.routes.draw do
  # Defines the root path route ("/")
  root to: 'pages#home'

  # Defines the page routes
  ## Login Related
  get "/login", to: "pages#login"
  get "/login/credentials", to: "pages#login_credentials"

  # Chat Related
  get "/chat/rooms", to: "pages#rooms"
  get "/chat/rooms/:id", to: "pages#room"

end
