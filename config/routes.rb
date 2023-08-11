Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/login', to: 'sessions#new'
end
