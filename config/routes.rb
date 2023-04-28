Rails.application.routes.draw do
  root 'home#index'
  resources :vehicles
  # resources :vehicles, only: %i[index new create show edit update destroy]
end
