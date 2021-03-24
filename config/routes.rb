Rails.application.routes.draw do
  devise_for :users
  get 'rooms/index'
  root to: "rooms#index"
  resources :rooms, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create, :new]
  end
  resources :genres, only: [:index]
end
