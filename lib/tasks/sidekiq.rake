namespace :sidekiq do
  desc 'Start Sidekiq Server'
  task start: :environment do
    system "bundle exec sidekiq"
  end
end