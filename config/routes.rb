Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  get 'auth/google_oauth2', as: 'google_oauth2_login'
  get '/auth/:provider/callback', to: 'sessions#create'
end
