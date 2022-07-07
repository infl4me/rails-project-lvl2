Rails.application.routes.draw do
  devise_for :users
  resources :posts, except: ['index']
  root to: 'posts#index'
end
