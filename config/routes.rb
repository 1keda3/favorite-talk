Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/search'
  devise_for :users
  get 'rooms/index'
  root to: "rooms#index"
  resources :rooms, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create, :new]
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
