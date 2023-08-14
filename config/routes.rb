Rails.application.routes.draw do
  root to: 'rooms#index'
  resources :rooms

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
