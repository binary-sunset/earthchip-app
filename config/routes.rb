Rails.application.routes.draw do
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'devices#index'

  resources :devices, only: %i[edit update show] do
    get 'details', to: 'devices#details', on: :member
  end

  namespace 'charts' do
    scope '/:device_id' do
      get 'graph_stats'
    end
  end
end
