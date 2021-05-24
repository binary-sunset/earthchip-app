Rails.application.routes.draw do
  root to: 'device#index'

  resources :device, only: %i[edit update]
end
