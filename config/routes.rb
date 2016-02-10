Rails.application.routes.draw do
  root 'requests#index'

  resources :requests, only: [:index, :show, :create]
end
