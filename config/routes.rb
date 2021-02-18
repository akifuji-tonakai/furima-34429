Rails.application.routes.draw do
  get 'rooms/index'
  get 'chats/index'
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
    resources :rooms,only: [:create, :show, :destroy]
    resources :chats,only: [:index,:create]
    resources :ex_prices, only: [:create, :update, :destroy]
  end
end