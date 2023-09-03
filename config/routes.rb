# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :cards
  resources :products do
    member do
      put 'status'
    end
  end
  resources :brands do
    member do
      put 'status'
    end
  end
  post '/auth/login', to: 'authentication#login'
end
