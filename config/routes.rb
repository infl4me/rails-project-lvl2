# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, except: ['index'] do
    resources :comments, only: %w[create]
    resources :likes, only: %w[create destroy]
  end
end
