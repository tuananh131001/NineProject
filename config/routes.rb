Rails.application.routes.draw do
  root to: 'rooms#index'
  resources :rooms do
    resources :messages
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
end
