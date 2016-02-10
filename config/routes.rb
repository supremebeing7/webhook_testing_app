Rails.application.routes.draw do
  root 'requests#index'

  resources :requests, only: [:index, :show, :create, :destroy] do
    get 'delete_all', to: 'requests#delete_all', on: :collection
  end
end
