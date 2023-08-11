Rails.application.routes.draw do
  devise_for :users
  match "/auth/failure", to: "users/omniauth_callbacks#failure", via: %i[get post]
  get "/auth/:provider", to: "users/omniauth_callbacks#confirm_request"
  match "/auth/:provider/callback", to: "users/omniauth_callbacks#complete", via: %i[get post]
end
