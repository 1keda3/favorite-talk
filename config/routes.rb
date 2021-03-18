Rails.application.routes.draw do
  get 'rooms/index'
  root to: "rooms#index"
  resources :rooms, only: [:index, :create, :new] do
    resources :messages, only: [:index, :create, :new]
  end
end
