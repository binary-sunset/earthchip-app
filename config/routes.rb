Rails.application.routes.draw do
  root to: 'devices#index'

  resources :devices, only: %i[edit update]
end
