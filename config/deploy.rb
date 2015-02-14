# config valid only for Capistrano 3.1
lock '3.1.0'

require "whenever/capistrano"

set :application, 'real_org'
set :repo_url, 'git@github.com:jeffsee55/real_org.git'

set :deploy_to, '/home/deploy/real_org'

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}



namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end
