# frozen_string_literal: true

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :users
  resources :cards do
    member do
      put 'create' => 'cards#create'
      put 'activate' => 'cards#activate'
      put 'cancel' => 'cards#cancel'
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

  resources :card_attempts, only: [:index]

  post '/auth/login', to: 'authentication#login'
end
