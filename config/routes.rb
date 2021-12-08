Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  resources :user_friends, only: [:create, :destroy]
  devise_for :users
  root 'welcome#index'
  get 'my_portifolio', to: 'users#my_portifolio'
  get 'search_stock', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
end
