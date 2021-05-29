Rails.application.routes.draw do
  root to: 'devices#index'

  resources :devices, only: %i[edit update show] do
    get 'details', to: 'devices#details', on: :member
  end
end
