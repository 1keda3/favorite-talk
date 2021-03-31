Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/search'
  devise_for :users
  get 'rooms/index'
  root to: "rooms#index"
  resources :rooms, only: [:index, :create, :new] do
    collection do
      get 'search'
    end
    resources :messages, only: [:index, :create, :new]
  end
  resources :tags, only: [:index, :new, :create, :show] do
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]
end
