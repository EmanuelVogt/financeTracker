Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]

  devise_for :users
  root 'welcome#index'
  get 'my_portifolio', to: 'users#my_portifolio'
  get 'search_stock', to: 'stocks#search'
  get 'search_friend', to: 'users#search'
  get 'my_friends', to: 'users#my_friends'
  resources :users, only: [:show]
end
