# frozen_string_literal: true

Rails.application.routes.draw do
  resources :users
  resources :cards do
    member do
      put 'issue' => 'card_attempts#issue'
    end
  end

  resources :card_attempts do
    member do
      put 'cancel' => 'card_attempts#cancel'
    end
  end

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
